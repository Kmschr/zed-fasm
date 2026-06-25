# zed-fasm

Syntax highlighting for [FASM](https://flatassembler.net/) (flat assembler) in the
[Zed](https://zed.dev) editor.

Activates on `.asm` and `.fasm` files.

## How it works

There is no FASM-specific Tree-sitter grammar, so this reuses the generic
[`RubixDev/tree-sitter-asm`](https://github.com/RubixDev/tree-sitter-asm)
grammar (pinned in `extension.toml`) and layers FASM-aware highlight queries on
top in `languages/fasm/highlights.scm`.

## Limitations

- Bare operand symbols (labels, macro args, data names) are colored as
  registers. The generic grammar can't tell them apart.
- `macro` / `struc` `{ ... }` bodies parse loosely; some lines may not highlight
  perfectly.
- Directive list in `highlights.scm` covers the common FASM keywords; add more
  to the `#match?` regex as needed.
