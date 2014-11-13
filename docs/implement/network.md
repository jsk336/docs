---
layout: default
type: implement
navgroup: docs
shortname: network
title: The Network Communcations Model of Antha
---
{% include toc.html %}

Network development is a key component to Flow Based Programming (FBP).  These networks are created in Antha by opening processes and directing channels to them.  The following text describes the syntax needed to do so.

Consider the following script. This program reads names, titles, and occupations and prints greetings based on those inputs.  It does so by creating a network of two processes: one which reads strings and produces greetings, a second which takes those greetings and prints them to the console. This program is a modified version of an example script created by V. Sibirov (https://github.com/trustmaster/goflow)

```go
// Example network program using Antha
package main

import (
    "fmt"
    "github.com/Synthace/goflow"
)

type Greeter struct {
    flow.Component               // component "superclass" embedded
    Name           <-chan string // input port
    Title          <-chan string // another input port
    Occupation          <-chan string // another input port
    Res            chan<- string // output port
}

func (g *Greeter) OnName(name string) {
    greeting := fmt.Sprintf("Hello, %s!", name)
    g.Res <- greeting
}

func (g *Greeter) OnTitle(title string) {
    greeting := fmt.Sprintf("I shall call you %s", title)
    g.Res <- greeting
}

func (g *Greeter) OnOccupation(occupation string) {
    greeting := fmt.Sprintf("You are a %s. Very impressive!", occupation)
    g.Res <- greeting
}

type Printer struct {
    flow.Component
    Line <-chan string
}

func (p *Printer) OnLine(line string) {
    fmt.Println(line)
}

type GreetingApp struct {
    flow.Graph
}

func NewGreetingApp() *GreetingApp {
    n := new(GreetingApp)
    n.InitGraphState()

    n.Add(new(Greeter), "greeter")
    n.Add(new(Printer), "printer")

    n.Connect("greeter", "Res", "printer", "Line")

    n.MapInPort("In1", "greeter", "Name")
    n.MapInPort("In2", "greeter", "Title")
    n.MapInPort("In3", "greeter", "Occupation")
    return n
}

func main() {
    net := NewGreetingApp()

    name := make(chan string)
    title := make(chan string)
    occupation := make(chan string)
    net.SetInPort("In1", name)
    net.SetInPort("In2", title)
    net.SetInPort("In3", occupation)

    flow.RunNet(net)

    title <- "Sir"
    name <- "John"
    name <- "Boris"
    title <- "Dame"
    name <- "Hanna"
	occupation <- "doctor"

    close(name)
	close(title)
	close(occupation)

    <-net.Wait()
}
```

The output from this script looks like this:
```
Hello, John!
I shall call you Sir
I shall call you Dame
Hello, Hanna!
Hello, Boris!
You are a doctor.  Very impressive!
```

## Define processes and inports

Every network of processes needs channels which handle inputs and outputs. A channel for inputs is an inport, a channel for outputs is an outport. A channel provides a mechanism for concurrently executing functions to communicate by sending and receiving values of a specified element type. The value of an uninitialized channel is nil. In this example, the processes are "Greeter" and "Printer." The inports and outports are defined as string channels in each process.

```go
type Greeter struct {
    flow.Component               		// component "superclass" embedded
    Name           <-chan string 		// input port
    Title          <-chan string 		// another input port
    Occupation          <-chan string	// another input port
    Res            chan<- string 		// output port
}
```

```go
type Printer struct {
    flow.Component
    Line <-chan string
}
```

## Define functions which transform the inputs.

Transformations on data are executed via functions which point to the processes defined earlier.

```go
func (g *Greeter) OnName(name string) {
    greeting := fmt.Sprintf("Hello, %s!", name)
    g.Res <- greeting
}

func (g *Greeter) OnTitle(title string) {
    greeting := fmt.Sprintf("I shall call you %s", title)
    g.Res <- greeting
}

func (g *Greeter) OnOccupation(occupation string) {
    greeting := fmt.Sprintf("You are a %s. Very impressive!", occupation)
    g.Res <- greeting
}
```

```go
func (p *Printer) OnLine(line string) {
    fmt.Println(line)
}
```

## Instantiate  new graph

```go
type GreetingApp struct {
    flow.Graph
}
```

## Add the processes to the graph and connect inports to outports.

```go
func NewGreetingApp() *GreetingApp {
    n := new(GreetingApp)
    n.InitGraphState()

    n.Add(new(Greeter), "greeter")
    n.Add(new(Printer), "printer")

    n.Connect("greeter", "Res", "printer", "Line")

    n.MapInPort("In1", "greeter", "Name")
    n.MapInPort("In2", "greeter", "Title")
    n.MapInPort("In3", "greeter", "Occupation")
    return n
}
```

## Open inport channels, send data to them, and close them again.

All data must be passed to the inports before closing any channels.

```go
func main() {
    net := NewGreetingApp()

    name := make(chan string)
    title := make(chan string)
    occupation := make(chan string)
    net.SetInPort("In1", name)
    net.SetInPort("In2", title)
    net.SetInPort("In3", occupation)

    flow.RunNet(net)

    title <- "Sir"
    name <- "John"
    name <- "Boris"
    title <- "Dame"
    name <- "Hanna"
	occupation <- "doctor"

    close(name)
	close(title)
	close(occupation)

    <-net.Wait()
}
```