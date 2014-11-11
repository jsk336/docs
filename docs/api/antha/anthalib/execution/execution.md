# execution
--
    import "."


## Usage

#### func  GetUUID

```go
func GetUUID() string
```

#### type ExecutionService

```go
type ExecutionService struct {
	StockMgr         StockService
	SampleTracker    SampleTrackerService
	Logger           LogService
	Scheduler        ScheduleService
	GarbageCollector GarbageCollectionService
}
```


```go
var ExecutionContext ExecutionService
```

#### type GarbageCollectionRequest

```go
type GarbageCollectionRequest map[string]interface{}
```


#### type GarbageCollectionService

```go
type GarbageCollectionService struct {
	RequestsIn  chan GarbageCollectionRequest
	RequestsOut chan GarbageCollectionRequest
}
```


#### func (*GarbageCollectionService) Init

```go
func (gcs *GarbageCollectionService) Init()
```

#### func (*GarbageCollectionService) RequestGarbageCollection

```go
func (gcs *GarbageCollectionService) RequestGarbageCollection(rin GarbageCollectionRequest) GarbageCollectionRequest
```

#### type LogRequest

```go
type LogRequest map[string]interface{}
```


#### type LogService

```go
type LogService struct {
	RequestsIn  chan LogRequest
	RequestsOut chan LogRequest
}
```


#### func (*LogService) Init

```go
func (ls *LogService) Init()
```

#### func (*LogService) RequestLog

```go
func (ls *LogService) RequestLog(rin LogRequest) LogRequest
```

#### type SampleRequest

```go
type SampleRequest map[string]interface{}
```


#### type SampleTrackerService

```go
type SampleTrackerService struct {
	RequestsIn  chan SampleRequest
	RequestsOut chan SampleRequest
}
```


#### func (*SampleTrackerService) Init

```go
func (ss *SampleTrackerService) Init()
```

#### func (*SampleTrackerService) TrackSample

```go
func (ss *SampleTrackerService) TrackSample(rin SampleRequest) SampleRequest
```

#### type ScheduleRequest

```go
type ScheduleRequest map[string]interface{}
```


#### type ScheduleService

```go
type ScheduleService struct {
	RequestsIn  chan ScheduleRequest
	RequestsOut chan ScheduleRequest
}
```


#### func (*ScheduleService) Init

```go
func (ss *ScheduleService) Init()
```

#### func (*ScheduleService) RequestSchedule

```go
func (ss *ScheduleService) RequestSchedule(rin ScheduleRequest) ScheduleRequest
```

#### type StockRequest

```go
type StockRequest map[string]interface{}
```


#### type StockService

```go
type StockService struct {
	RequestsIn  chan StockRequest
	RequestsOut chan StockRequest
}
```


#### func (*StockService) Init

```go
func (ss *StockService) Init()
```

#### func (*StockService) RequestStock

```go
func (ss *StockService) RequestStock(rin StockRequest) StockRequest
```
