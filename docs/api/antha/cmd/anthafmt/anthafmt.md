---
layout: default
type: api
navgroup: docs
shortname: cmd/anthafmt
title: cmd/anthafmt
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: cmd/anthafmt
---
# anthafmt
--
Gofmt formats Go programs. It uses tabs (width = 8) for indentation and blanks
for alignment.

Without an explicit path, it processes the standard input. Given a file, it
operates on that file; given a directory, it operates on all .go files in that
directory, recursively. (Files starting with a period are ignored.) By default,
anthamt prints the reformatted sources to standard output.

Usage:

    anthamt [flags] [path ...]

The flags are:

    -d
    	Do not print reformatted sources to standard output.
    	If a file's formatting is different than anthamt's, print diffs
    	to standard output.
    -e
    	Print all (including spurious) errors.
    -l
    	Do not print reformatted sources to standard output.
    	If a file's formatting is different from anthamt's, print its name
    	to standard output.
    -r rule
    	Apply the rewrite rule to the source before reformatting.
    -s
    	Try to simplify code (after applying the rewrite rule, if any).
    -w
    	Do not print reformatted sources to standard output.
    	If a file's formatting is different from anthamt's, overwrite it
    	with anthamt's version.

Debugging support:

    -cpuprofile filename
    	Write cpu profile to the specified file.

The rewrite rule specified with the -r flag must be a string of the form:

    pattern -> replacement

Both pattern and replacement must be valid Go expressions. In the pattern,
single-character lowercase identifiers serve as wildcards matching arbitrary
sub-expressions; those expressions will be substituted for the same identifiers
in the replacement.

When anthamt reads from standard input, it accepts either a full Go program or a
program fragment. A program fragment must be a syntactically valid declaration
list, statement list, or expression. When formatting such a fragment, anthamt
preserves leading indentation as well as leading and trailing spaces, so that
individual sections of a Go program can be formatted by piping them through
anthamt.


### Examples

To check files for unnecessary parentheses:

    anthamt -r '(a) -> a' -l *.go

To remove the parentheses:

    anthamt -r '(a) -> a' -w *.go

To convert the package tree from explicit slice upper bounds to implicit ones:

    anthamt -r 'α[β:len(α)] -> α[β:]' -w $GOROOT/src/pkg


The simplify command

When invoked with -s anthamt will make the following source transformations
where possible.

    An array, slice, or map composite literal of the form:
    	[]T{T{}, T{}}
    will be simplified to:
    	[]T{ { }, { } }

    A slice expression of the form:
    	s[a:len(s)]
    will be simplified to:
    	s[a:]

    A range of the form:
    	for x, _ = range v {...}
    will be simplified to:
    	for x = range v {...}
