---
layout: default
type: api
navgroup: docs
shortname: antha/format
title: antha/format
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: antha/format
  description: Package format implements standard formatting of Antha source.
---
# format
--
    import "."

Package format implements standard formatting of Antha source.

## Usage

#### func  Node

```go
func Node(dst io.Writer, fset *token.FileSet, node interface{}) error
```
Node formats node in canonical gofmt style and writes the result to dst.

The node type must be *ast.File, *printer.CommentedNode, []ast.Decl, []ast.Stmt,
or assignment-compatible to ast.Expr, ast.Decl, ast.Spec, or ast.Stmt. Node does
not modify node. Imports are not sorted for nodes representing partial source
files (i.e., if the node is not an *ast.File or a *printer.CommentedNode not
wrapping an *ast.File).

The function may return early (before the entire result is written) and return a
formatting error, for instance due to an incorrect AST.

#### func  Source

```go
func Source(src []byte) ([]byte, error)
```
Source formats src in canonical gofmt style and returns the result or an (I/O or
syntax) error. src is expected to be a syntactically correct Antha source file, or
a list of Antha declarations or statements.

If src is a partial source file, the leading and trailing space of src is
applied to the result (such that it has the same leading and trailing space as
src), and the result is indented by the same amount as the first line of src
containing code. Imports are not sorted for partial source files.
