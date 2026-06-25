# zed-fasm

Syntax highlighting for [FASM](https://flatassembler.net/) (flat assembler) in the
[Zed](https://zed.dev) editor.

Activates on `.asm` and `.fasm` files.

## How it works

Highlighting is driven by a dedicated FASM Tree-sitter grammar,
[`Kmschr/tree-sitter-fasm`](https://github.com/Kmschr/tree-sitter-fasm) (pinned
in `extension.toml`). The extension's `languages/fasm/highlights.scm` maps the
grammar's nodes to highlight groups and classifies keywords (directives, segment
attributes, format names) with `#match?` predicates, so those lists are easy to
extend.

## Limitations

- It is a highlighter, not an assembler: the grammar is forgiving and does not
  validate operands or instruction semantics.
- Keyword lists in `highlights.scm` cover the common FASM directives, segment
  attributes, and output formats; add more to the `#match?` regexes as needed.
