---
layout: default
type: api
navgroup: docs
shortname: doc/testdata
title: doc/testdata
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: doc/testdata
---
# error1
--
    import "."


## Usage

#### type I0

```go
type I0 interface {
	// When embedded, the predeclared error interface
	// must remain visible in interface types.
	error
}
```


#### type S0

```go
type S0 struct {
}
```


#### type T0

```go
type T0 struct {
	ExportedField interface {
		// error should be visible
		error
	}
}
```
