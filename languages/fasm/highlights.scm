; General
(label
  [(ident) (word)] @label)

(reg) @variable.builtin

(meta
  kind: (_) @function.builtin)

(instruction
  kind: (_) @function.builtin)

(const
  name: (word) @constant)

; Comments
[
  (line_comment)
  (block_comment)
] @comment

; Literals
(int) @number

(float) @number.float

(string) @string

; Size / type keywords
[
  "byte"
  "word"
  "dword"
  "qword"
  "ptr"
  "rel"
  "label"
  "const"
] @keyword

; Operators & Punctuation
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "|"
  "^"
  "&"
] @operator

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  ","
  ":"
] @punctuation.delimiter

; FASM directives — parsed as instructions by the generic grammar, recolored
; here as keywords. Listed after the generic (instruction) rule so they win.
((instruction
  kind: (word) @keyword)
  (#match? @keyword "^(?i)(format|segment|section|entry|use16|use32|use64|public|extrn|extern|include|org|align|times|virtual|repeat|rept|irp|while|if|else|end|display|err|assert|macro|purge|struc|restruc|define|equ|fix|db|dw|dd|dq|dt|rb|rw|rd|rq|rt|file)$"))

; Segment / section attribute keywords. These appear as operands (e.g.
; `SEGMENT READABLE EXECUTABLE`), so match the operand word text directly.
((word) @keyword
  (#match? @keyword "(?i)^(readable|writeable|writable|executable|shareable|discardable|notpageable|resource|fixups|import|export|native|gui|console|efi|efiboot|efiruntime|dll|wdm|nx|large)$"))

; Output format / type names after FORMAT (ELF, ELF64, PE, PE64, COFF, MZ, ...).
((word) @type
  (#match? @type "(?i)^(elf|elf64|elfexe|elfruntime|pe|pe64|peconsole|pegui|ms|ms64|coff|mz|bin|binary|at)$"))
