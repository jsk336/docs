# flow
--
    import "."

The flow package is a framework for Flow-based programming in Go.

## Usage

```go
const (
	// ComponentModeUndefined stands for a fallback component mode (Async).
	ComponentModeUndefined = iota
	// ComponentModeAsync stands for asynchronous functioning mode.
	ComponentModeAsync
	// ComponentModeSync stands for synchronous functioning mode.
	ComponentModeSync
	// ComponentModePool stands for async functioning with a fixed pool.
	ComponentModePool
)
```

```go
const DefaultRegistryCapacity = 64
```
DefaultRegistryCapacity is the capacity component registry is initialized with.

```go
var ComponentRegistry = make(map[string]ComponentConstructor, DefaultRegistryCapacity)
```
ComponentRegistry is used to register components and spawn processes given just
a string component name.

```go
var DefaultBufferSize = 0
```
DefaultBufferSize is the default channel buffer capacity.

```go
var DefaultComponentMode = ComponentModeAsync
```
DefaultComponentMode is the preselected functioning mode of all components being
run.

```go
var DefaultNetworkCapacity = 32
```
DefaultNetworkCapacity is the default capacity of network's processes/ports
maps.

```go
var DefaultNetworkPortsNum = 16
```
Default network output or input ports number

#### func  Factory

```go
func Factory(componentName string) interface{}
```
Factory creates a new instance of a component registered under a specific name.

#### func  NewGraph

```go
func NewGraph() interface{}
```
NewGraph creates a new canvas graph that can be modified at run-time. Implements
ComponentConstructor interace, so can it be used with Factory.

#### func  Register

```go
func Register(componentName string, constructor ComponentConstructor) bool
```
Register registers a component so that it can be instantiated at run-time using
component Factory. It returns true on success or false if component name is
already taken.

#### func  RegisterJSON

```go
func RegisterJSON(componentName, filePath string) bool
```
RegisterJSON registers an external JSON graph definition as a component that can
be instantiated at run-time using component Factory. It returns true on success
or false if component name is already taken.

#### func  RunNet

```go
func RunNet(i interface{})
```
RunNet runs the network by starting all of its processes. It runs Init/Finish
handlers if the network implements Initializable/Finalizable interfaces.

#### func  RunProc

```go
func RunProc(c interface{}, nump int) bool
```
RunProc runs event handling loop on component ports. It returns true on success
or panics with error message and returns false on error.

#### func  StopProc

```go
func StopProc(c interface{}) bool
```
StopProc terminates the process if it is running. It doesn't close any in or out
ports of the process, so it can be replaced without side effects.

#### func  Unregister

```go
func Unregister(componentName string) bool
```
Unregister removes a component with a given name from the component registry and
returns true or returns false if no such component is registered.

#### type Canvas

```go
type Canvas struct {
	Graph
}
```

Canvas is a generic graph that is manipulated at run-time only

#### type Component

```go
type Component struct {
	// Is running flag indicates that the process is currently running.
	IsRunning bool
	// Net is a pointer to network to inform it when the process is started and over
	// or to change its structure at run time.
	Net *Graph
	// Mode is component's functioning mode.
	Mode int8
	// PoolSize is used to define pool size when using ComponentModePool.
	PoolSize uint8
	// Term chan is used to terminate the process immediately without closing
	// any channels.
	Term chan struct{}
}
```

Component is a generic flow component that has to be contained in concrete
components. It stores network-specific information.

#### type ComponentConstructor

```go
type ComponentConstructor func() interface{}
```

ComponentConstructor is a function that can be registered in the
ComponentRegistry so that it is used when creating new processes of a specific
component using Factory function at run-time.

#### type Finalizable

```go
type Finalizable interface {
	Finish()
}
```

Finalizable is the interface implemented by components/graphs with extra
finalization code.

#### type Graph

```go
type Graph struct {

	// Net is a pointer to parent network.
	Net *Graph
}
```

Graph represents a graph of processes connected with packet channels.

#### func  LoadJSON

```go
func LoadJSON(filename string) *Graph
```
LoadJSON loads a JSON graph definition file into a flow.Graph object that can be
run or used in other networks

#### func  ParseJSON

```go
func ParseJSON(js []byte) *Graph
```
ParseJSON converts a JSON network definition string into a flow.Graph object
that can be run or used in other networks

#### func (*Graph) Add

```go
func (n *Graph) Add(c interface{}, name string) bool
```
Add adds a new process with a given name to the network. It returns true on
success or panics and returns false on error.

#### func (*Graph) AddGraph

```go
func (n *Graph) AddGraph(name string) bool
```
AddGraph adds a new blank graph instance to a network. That instance can be
modified then at run-time.

#### func (*Graph) AddIIP

```go
func (n *Graph) AddIIP(data interface{}, processName, portName string) bool
```
AddIIP adds an Initial Information packet to the network

#### func (*Graph) AddNew

```go
func (n *Graph) AddNew(componentName string, processName string) bool
```
AddNew creates a new process instance using component factory and adds it to the
network.

#### func (*Graph) Connect

```go
func (n *Graph) Connect(senderName, senderPort, receiverName, receiverPort string) bool
```
Connect connects a sender to a receiver and creates a channel between them using
DefaultBufferSize. Normally such a connection is unbuffered but you can change
by setting flow.DefaultBufferSize > 0 or by using ConnectBuf() function instead.
It returns true on success or panics and returns false if error occurs.

#### func (*Graph) ConnectBuf

```go
func (n *Graph) ConnectBuf(senderName, senderPort, receiverName, receiverPort string, bufferSize int) bool
```
Connect connects a sender to a receiver using a channel with a buffer of a given
size. It returns true on success or panics and returns false if error occurs.

#### func (*Graph) DecSendChanRefCount

```go
func (n *Graph) DecSendChanRefCount(c reflect.Value) bool
```
Decrements SendChanRefCount It returns true if the RefCount has reached 0

#### func (*Graph) Disconnect

```go
func (n *Graph) Disconnect(senderName, senderPort, receiverName, receiverPort string) bool
```
Disconnect removes a connection between sender's outport and receiver's inport.

#### func (*Graph) Get

```go
func (n *Graph) Get(processName string) interface{}
```
Get returns a node contained in the network by its name.

#### func (*Graph) IncSendChanRefCount

```go
func (n *Graph) IncSendChanRefCount(c reflect.Value)
```
Increments SendChanRefCount

#### func (*Graph) InitGraphState

```go
func (n *Graph) InitGraphState()
```
InitGraphState method initializes graph fields and allocates memory.

#### func (*Graph) MapInPort

```go
func (n *Graph) MapInPort(name, procName, procPort string) bool
```
MapInPort adds an inport to the net and maps it to a contained proc's port. It
returns true on success or panics and returns false on error.

#### func (*Graph) MapOutPort

```go
func (n *Graph) MapOutPort(name, procName, procPort string) bool
```
MapOutPort adds an outport to the net and maps it to a contained proc's port. It
returns true on success or panics and returns false on error.

#### func (*Graph) Ready

```go
func (n *Graph) Ready() <-chan struct{}
```
Ready returns a channel that can be used to suspend the caller goroutine until
the network is ready to accept input packets

#### func (*Graph) Remove

```go
func (n *Graph) Remove(processName string) bool
```
Remove deletes a process from the graph. First it stops the process if running.
Then it disconnects it from other processes and removes the connections from the
graph. Then it drops the process itself.

#### func (*Graph) RemoveIIP

```go
func (n *Graph) RemoveIIP(processName, portName string) bool
```
RemoveIIP detaches an IIP from specific process and port

#### func (*Graph) Rename

```go
func (n *Graph) Rename(processName, newName string) bool
```
Rename changes a process name in all connections, external ports, IIPs and the
graph itself.

#### func (*Graph) RenameInPort

```go
func (n *Graph) RenameInPort(oldName, newName string) bool
```
RenameInPort changes graph's inport name

#### func (*Graph) RenameOutPort

```go
func (n *Graph) RenameOutPort(oldName, newName string) bool
```
RenameOutPort changes graph's outport name

#### func (*Graph) SetInPort

```go
func (n *Graph) SetInPort(name string, channel interface{}) bool
```
SetInPort assigns a channel to a network's inport to talk to the outer world. It
returns true on success or false if the inport cannot be set.

#### func (*Graph) SetOutPort

```go
func (n *Graph) SetOutPort(name string, channel interface{}) bool
```
SetOutPort assigns a channel to a network's outport to talk to the outer world.
It returns true on success or false if the outport cannot be set.

#### func (*Graph) Stop

```go
func (n *Graph) Stop()
```
Stop terminates the network without closing any connections

#### func (*Graph) StopProc

```go
func (n *Graph) StopProc(procName string) bool
```
StopProc stops a specific process in the net

#### func (*Graph) UnmapInPort

```go
func (n *Graph) UnmapInPort(name string) bool
```
UnmapInPort removes an existing inport mapping

#### func (*Graph) UnmapOutPort

```go
func (n *Graph) UnmapOutPort(name string) bool
```
UnmapOutPort removes an existing outport mapping

#### func (*Graph) UnsetInPort

```go
func (n *Graph) UnsetInPort(name string) bool
```
UnsetInPort removes an external inport from the graph

#### func (*Graph) UnsetOutPort

```go
func (n *Graph) UnsetOutPort(name string) bool
```
UnsetOutPort removes an external outport from the graph

#### func (*Graph) Wait

```go
func (n *Graph) Wait() <-chan struct{}
```
Wait returns a channel that can be used to suspend the caller goroutine until
the network finishes its job

#### type Initializable

```go
type Initializable interface {
	Init()
}
```

Initalizable is the interface implemented by components/graphs with custom
initialization code.

#### type Message

```go
type Message struct {
	// Protocol is NoFlo protocol identifier:
	// "runtime", "component", "graph" or "network"
	Protocol string
	// Command is a command to be executed within the protocol
	Command string
	// Payload is JSON-encoded body of the message
	Payload interface{}
}
```

Message represents a single FBP protocol message

#### type Runtime

```go
type Runtime struct {
}
```

Runtime is a NoFlo-compatible runtime implementing the FBP protocol

#### func (*Runtime) Handle

```go
func (r *Runtime) Handle(ws *websocket.Conn)
```

#### func (*Runtime) Id

```go
func (r *Runtime) Id() string
```
Id returns runtime's UUID v4

#### func (*Runtime) Init

```go
func (r *Runtime) Init()
```
Register command handlers

#### func (*Runtime) Listen

```go
func (r *Runtime) Listen(address string)
```

#### func (*Runtime) Ready

```go
func (r *Runtime) Ready() chan struct{}
```
Ready returns a channel which is closed when the runtime is ready to work

#### func (*Runtime) Stop

```go
func (r *Runtime) Stop()
```
Stop tells the runtime to shut down

#### type Shutdowner

```go
type Shutdowner interface {
	Shutdown()
}
```

Shutdowner is the interface implemented by components overriding default
Shutdown() behavior.
