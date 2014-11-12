---
layout: default
type: api
navgroup: docs
shortname: antha/doc
title: antha/doc
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: antha/doc
---
# doc
--
    import "."

Package doc extracts source code documentation from a Go AST.

## Usage

```go
var IllegalPrefixes = []string{
	"copyright",
	"all rights",
	"author",
}
```

#### func  Examples

```go
func Examples(files ...*ast.File) []*Example
```
Examples returns the examples found in the files, sorted by Name field. The
Order fields record the order in which the examples were encountered.

Playable Examples must be in a package whose name ends in "_test". An Example is
"playable" (the Play field is non-nil) in either of these circumstances:

    - The example function is self-contained: the function references only
      identifiers from other packages (or predeclared identifiers, such as
      "int") and the test file does not include a dot import.
    - The entire test file is the example: the file contains exactly one
      example function, zero test or benchmark functions, and at least one
      top-level function, type, variable, or constant declaration other
      than the example function.

#### func  Synopsis

```go
func Synopsis(s string) string
```
Synopsis returns a cleaned version of the first sentence in s. That sentence
ends after the first period followed by space and not preceded by exactly one
uppercase letter. The result string has no \n, \r, or \t characters and uses
only single spaces between words. If s starts with any of the IllegalPrefixes,
the result is the empty string.

#### func  ToHTML

```go
func ToHTML(w io.Writer, text string, words map[string]string)
```
ToHTML converts comment text to formatted HTML. The comment was prepared by
DocReader, so it is known not to have leading, trailing blank lines nor to have
trailing spaces at the end of lines. The comment markers have already been
removed.

Each span of unindented non-blank lines is converted into a single paragraph.
There is one exception to the rule: a span that consists of a single line, is
followed by another paragraph span, begins with a capital letter, and contains
no punctuation is formatted as a heading.

A span of indented lines is converted into a <pre> block, with the common indent
prefix removed.

URLs in the comment text are converted into links; if the URL also appears in
the words map, the link is taken from the map (if the corresponding map value is
the empty string, the URL is not converted into a link).

Go identifiers that appear in the words map are italicized; if the corresponding
map value is not the empty string, it is considered a URL and the word is
converted into a link.

#### func  ToText

```go
func ToText(w io.Writer, text string, indent, preIndent string, width int)
```
ToText prepares comment text for presentation in textual output. It wraps
paragraphs of text to width or fewer Unicode code points and then prefixes each
line with the indent. In preformatted sections (such as program text), it
prefixes each non-blank line with preIndent.

#### type Example

```go
type Example struct {
	Name        string // name of the item being exemplified
	Doc         string // example function doc string
	Code        ast.Node
	Play        *ast.File // a whole program version of the example
	Comments    []*ast.CommentGroup
	Output      string // expected output
	EmptyOutput bool   // expect empty output
	Order       int    // original source code order
}
```

An Example represents an example function found in a source files.

#### type Filter

```go
type Filter func(string) bool
```


#### type Func

```go
type Func struct {
	Doc  string
	Name string
	Decl *ast.FuncDecl

	// methods
	// (for functions, these fields have the respective zero value)
	Recv  string // actual   receiver "T" or "*T"
	Orig  string // original receiver "T" or "*T"
	Level int    // embedding level; 0 means not embedded
}
```

Func is the documentation for a func declaration.

#### type Mode

```go
type Mode int
```

Mode values control the operation of New.

```go
const (
	// extract documentation for all package-level declarations,
	// not just exported ones
	AllDecls Mode = 1 << iota

	// show all embedded methods, not just the ones of
	// invisible (unexported) anonymous fields
	AllMethods
)
```

#### type Note

```go
type Note struct {
	Pos, End token.Pos // position range of the comment containing the marker
	UID      string    // uid found with the marker
	Body     string    // note body text
}
```

A Note represents a marked comment starting with "MARKER(uid): note body". Any
note with a marker of 2 or more upper case [A-Z] letters and a uid of at least
one character is recognized. The ":" following the uid is optional. Notes are
collected in the Package.Notes map indexed by the notes marker.

#### type Package

```go
type Package struct {
	Doc        string
	Name       string
	ImportPath string
	Imports    []string
	Filenames  []string
	Notes      map[string][]*Note
	// DEPRECATED. For backward compatibility Bugs is still populated,
	// but all new code should use Notes instead.
	Bugs []string

	// declarations
	Consts []*Value
	Types  []*Type
	Vars   []*Value
	Funcs  []*Func
}
```

Package is the documentation for an entire package.

#### func  New

```go
func New(pkg *ast.Package, importPath string, mode Mode) *Package
```
New computes the package documentation for the given package AST. New takes
ownership of the AST pkg and may edit or overwrite it.

#### func (*Package) Filter

```go
func (p *Package) Filter(f Filter)
```
Filter eliminates documentation for names that don't pass through the filter f.
TODO(gri): Recognize "Type.Method" as a name.

#### type Type

```go
type Type struct {
	Doc  string
	Name string
	Decl *ast.GenDecl

	// associated declarations
	Consts  []*Value // sorted list of constants of (mostly) this type
	Vars    []*Value // sorted list of variables of (mostly) this type
	Funcs   []*Func  // sorted list of functions returning this type
	Methods []*Func  // sorted list of methods (including embedded ones) of this type
}
```

Type is the documentation for a type declaration.

#### type Value

```go
type Value struct {
	Doc   string
	Names []string // var or const names in declaration order
	Decl  *ast.GenDecl
}
```

Value is the documentation for a (possibly grouped) var or const declaration.
