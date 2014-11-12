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

defines types for dealing with liquid handling requests

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

#### type LHComponent

```go
type LHComponent map[string]interface{}
```

structure describing a liquid component and its desired properties

#### type LHParameter

```go
type LHParameter map[string]interface{}
```

describes sets of parameters which can be used to create a configuration

#### type LHPlate

```go
type LHPlate map[string]interface{}
```

structure describing a microplate

#### type LHPosition

```go
type LHPosition map[string]interface{}
```

describes a position on the liquid handling deck and its current state

#### type LHPrms

```go
type LHPrms map[string]interface{}
```

describes a liquid handler, its capabilities and current state

#### type LHRequest

```go
type LHRequest map[string]interface{}
```

structure for defining a request to the liquid handler

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

#### type LHSetup

```go
type LHSetup map[string]interface{}
```

structure defining a liquid handler setup

#### type LHSolution

```go
type LHSolution map[string]interface{}
```

structure describing a solution: a combination of liquid components

#### type LHWell

```go
type LHWell map[string]interface{}
```

structure representing a well on a microplate - description of a destination
