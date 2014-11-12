---
layout: default
type: api
navgroup: docs
shortname: anthalib/mixingrules
title: anthalib/mixingrules
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: anthalib/mixingrules
---
# mixingrules
--
    import "."


## Usage

#### type MixBlackList

```go
type MixBlackList map[string]string
```

a list defining which components cannot directly be mixed

#### func  GetMixBlackList

```go
func GetMixBlackList() MixBlackList
```
factory method for a mix blacklist object
