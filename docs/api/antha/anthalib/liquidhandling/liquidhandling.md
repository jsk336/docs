---
layout: default
type: api
navgroup: docs
shortname: anthalib/liquidhandling
title: anthalib/liquidhandling
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: anthalib/liquidhandling
---
# liquidhandling
--
    import "."


## Usage

#### func  Init

```go
func Init(request LHRequest) *liquidhandler
```
initialize the liquid handling structure

#### func  MakeConfigFile

```go
func MakeConfigFile(fn string, request LHRequest)
```

#### func  MakePlanFile

```go
func MakePlanFile(fn string, request LHRequest)
```

#### func  RunLiquidHandler

```go
func RunLiquidHandler(*chan *LHRequest)
```
tell the liquid handler to run

#### type LHRequest

```go
type LHRequest map[string]interface{}
```

map structure defining a liquid handling request

#### func  BasicExecutionPlanner

```go
func BasicExecutionPlanner(request, parameters LHRequest) LHRequest
```
a default execution planner which relies on a call to code external to the Antha
project.

#### func  BasicLayoutAgent

```go
func BasicLayoutAgent(request, params LHRequest) LHRequest
```
default layout: requests fill plates in column order

#### func  BasicSetupAgent

```go
func BasicSetupAgent(request, params LHRequest) LHRequest
```
default setup agent
