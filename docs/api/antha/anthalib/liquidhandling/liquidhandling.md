# liquidhandling
--
    import "."


## Usage

#### func  Init

```go
func Init(request LHRequest) *liquidhandler
```

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

#### type LHRequest

```go
type LHRequest map[string]interface{}
```


#### func  BasicExecutionPlanner

```go
func BasicExecutionPlanner(request, parameters LHRequest) LHRequest
```

#### func  BasicLayoutAgent

```go
func BasicLayoutAgent(request, params LHRequest) LHRequest
```

#### func  BasicSetupAgent

```go
func BasicSetupAgent(request, params LHRequest) LHRequest
```
