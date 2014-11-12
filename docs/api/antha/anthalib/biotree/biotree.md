---
layout: default
type: api
navgroup: docs
shortname: anthalib/biotree
title: anthalib/biotree
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: anthalib/biotree
---
# biotree
--
    import "."


## Usage

#### type TOL

```go
type TOL struct {
	UID      string
	Name     string
	Taxid    string
	Parent   *TOL
	Depth    int
	Children []*TOL
}
```

we use the open tree of life to define taxonomic relationships

#### func  Load_TOL

```go
func Load_TOL(filename string) (*TOL, *map[string]*TOL)
```
read the data from the opentree file

#### func (TOL) Find_string

```go
func (t TOL) Find_string(name string) *TOL
```
find a node by name

#### func (TOL) Get_taxonomy

```go
func (t TOL) Get_taxonomy(arr []string) []string
```
extract the lineage of one particular node

#### func (TOL) IsAncestorOf

```go
func (t TOL) IsAncestorOf(t2 *TOL) string
```
returns the string name of the LCA if t is the ancestor of t2
