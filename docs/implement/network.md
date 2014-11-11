Network development is a key component to Flow Based Programming (FBP).  These networks are created in Antha by opening processes and directing channels to them.  The following text describes the syntax needed to do so.

Consider the following script:
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