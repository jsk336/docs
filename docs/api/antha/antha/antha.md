---
layout: default
type: api
navgroup: docs
shortname: antha/antha
title: antha/antha
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: antha/antha
---
# antha
--
    import "."

Defines interfaces for antha elements

## Usage

#### type Capabilities

```go
type Capabilities interface {
	Capabilities() map[string]string
}
```

returns a map of functions supported by the element and their return types
