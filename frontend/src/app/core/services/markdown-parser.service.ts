import { Injectable } from '@angular/core';
import { InlineToken, ParsedBlock } from '../models';

@Injectable({ providedIn: 'root' })
export class MarkdownParserService {

  parse(markdown: string): ParsedBlock[] {
    const lines = markdown.split('\n');
    const blocks: ParsedBlock[] = [];
    let i = 0;

    while (i < lines.length) {
      const trimmed = lines[i].trim();

      if (!trimmed) { i++; continue; }

      // Headings
      const h3 = trimmed.match(/^###\s+(.+)/);
      const h2 = trimmed.match(/^##\s+(.+)/);
      const h1 = trimmed.match(/^#\s+(.+)/);
      if (h3) { blocks.push({ kind: 'heading', level: 3, text: this.stripInline(h3[1]) }); i++; continue; }
      if (h2) { blocks.push({ kind: 'heading', level: 2, text: this.stripInline(h2[1]) }); i++; continue; }
      if (h1) { blocks.push({ kind: 'heading', level: 1, text: this.stripInline(h1[1]) }); i++; continue; }

      // Table
      if (trimmed.startsWith('|')) {
        const tableLines: string[] = [];
        while (i < lines.length && lines[i].trim().startsWith('|')) {
          tableLines.push(lines[i].trim());
          i++;
        }
        const tbl = this.parseTable(tableLines);
        if (tbl) blocks.push(tbl);
        continue;
      }

      // List
      if (/^[-*]\s/.test(trimmed)) {
        const items: InlineToken[][] = [];
        while (i < lines.length && /^[-*]\s/.test(lines[i].trim())) {
          items.push(this.parseInline(lines[i].trim().replace(/^[-*]\s/, '')));
          i++;
        }
        blocks.push({ kind: 'list', items });
        continue;
      }

      // Paragraph — accumulate consecutive non-empty, non-special lines
      const paraLines: string[] = [];
      while (
        i < lines.length &&
        lines[i].trim() &&
        !lines[i].trim().startsWith('#') &&
        !lines[i].trim().startsWith('|') &&
        !/^[-*]\s/.test(lines[i].trim())
      ) {
        paraLines.push(lines[i].trim());
        i++;
      }
      if (paraLines.length > 0) {
        blocks.push({ kind: 'paragraph', tokens: this.parseInline(paraLines.join(' ')) });
      }
    }

    return blocks;
  }

  parseInline(text: string): InlineToken[] {
    const tokens: InlineToken[] = [];
    const re = /\*\*(.+?)\*\*|\*([^*]+?)\*|`(.+?)`|([^*`]+)/gs;
    let m: RegExpExecArray | null;
    while ((m = re.exec(text)) !== null) {
      if (m[1] !== undefined) tokens.push({ t: m[1], b: true });
      else if (m[2] !== undefined) tokens.push({ t: m[2], i: true });
      else if (m[3] !== undefined) tokens.push({ t: m[3], c: true });
      else if (m[4] !== undefined && m[4]) tokens.push({ t: m[4] });
    }
    return tokens;
  }

  private stripInline(text: string): string {
    return text.replace(/\*\*/g, '').replace(/\*/g, '').replace(/`/g, '');
  }

  private parseTable(lines: string[]): ParsedBlock | null {
    const isSeparator = (l: string) => /^\|[\s\-|:]+\|$/.test(l);
    const dataLines = lines.filter(l => !isSeparator(l));
    if (dataLines.length === 0) return null;

    const parseRow = (l: string): string[] =>
      l.split('|')
        .slice(1, -1)
        .map(c => c.trim());

    const headers = parseRow(dataLines[0]);
    const rows = dataLines.slice(1).map(parseRow);
    return { kind: 'table', headers, rows };
  }
}
