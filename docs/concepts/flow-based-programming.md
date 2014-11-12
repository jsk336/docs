---
layout: default
type: concepts
navgroup: docs
shortname: FBP
title: Flow Based Programming in Antha
---

{% include toc.html %}

## Why Flow Based Programming? ##

As biological research and development becomes more and more computerized, we will demand better speed and ease of use from our algorithms.  Enter flow based programming (FBP).  FBP executes more quickly than traditional programming important when you're running a few million experiments and it lends itself to visual composition handy for the biologist without a strong background in computer science.

## How Does Flow Based Programming Work? ##

The mechanics of FBP are best described by the inventor himself, J. Paul Morrison

>Flow-Based Programming defines applications using the metaphor of a "data factory". It views an application not as a single, sequential process, which starts at a point in time, and then does one thing at a time until it is finished, but as a network of asynchronous processes communicating by means of streams of structured data chunks, called "information packets" (IPs). (http://www.jpaulmorrison.com/fbp/introduction.html)

Despite having been around for over 40 years, FBP is recently gaining in popularity, largely due to the efforts of Henri Bergius via NoFlo. (http://noflojs.org/).  Modern FBP systems can take advantage of computer systems with multiple cores which allow it to run processes concurrently, thus cutting down on computation time.

## What are the Elements of Flow Based Programming? ##

An excellent overview of the concept elements in FBP can be found through the wiki on flowbased.org (https://github.com/flowbased/flowbased.org/wiki/Concepts) and has been reproduced here with some annotations for the convenience of the reader.

## Components ##

Components are the building blocks in Flow-based programming.  This section covers elementary components which are usually written as classes, functions or small programs in conventional programming languages.  For composite components see [Graphs section](Concepts#Graphs) below. 

### Processes ###

A Process is an instance of a Component living in a Graph.  The system should handle processes in the form of coroutines, threads or a similar form of concurrency, or at least provide the illusion of it to the graph designer.  They should only be able to access their own internal state and ports but not much else about the graph itself and other processes. 

### Connections ###

Processes communicate via connections, which the processes access by means of Ports.  Connections are usually implemented via bounded buffers or FIFO queues.  The size of the buffer or the maximum number of packets a queue can hold is known as connection Capacity.  Some FBP implementations allow connections with 0 capacity, meaning that data IPs are transferred immediately between the sending and receiving processes. 

### Ports ###

Ports are the points of contact between processes and connections.  They are named, and may also be indexed if the port is an Array Port.  The port name may be viewed as a contract between the component code and the network specification.   A Process can send to, and receive from, any of the ports. 

#### Input ports (inport)####

Inports provide a READ or RECEIVE functionality to dequeue messages from the buffer, and require an index in the case of Array Ports.  Other features like obtaining the buffer load or which indexes have incoming packets in the case of array ports are desirable for simplifying the design and implementation of some components.  An example of this would be an event handler that receives from an unknown amount of sources but they all provide the same type of data. 

In "classical" FBP, connections connect one or more output ports to one input port, considering each index of an array port as a single port.  If a connection becomes empty, the process being fed by that connection is suspended until more packets arrive (in "classical" FBP, this can only be one process).  In other words, when a process makes a READ on an empty port, it blocks the process until a packet arrives.  This is valid for "classical" FBP, while other implementations either wait for packets to activate events or have a collection of buffers the process can access. 

In "classical" FBP, when more than one output port is connected to an input ports, packets arrive at the input port in "first come, first served" sequence.  

#### Output ports ####

They provide a SEND functionality to queue the packet into the port of the connected process.  Usually sends require a packet and the name of the port, or the send is a method and the output port is a known object. 
If the connection fills up with packets, the process is suspended until the buffer is not full. 

### Internal state ###

A Process, being an instance of a Component, can hold its internal state as long as it's active.  An important part of FBP is keeping the state private and only interacting via port actions with other processes. 

### Data processing ###

In FBP data processing is focused on handling streams of packets and embedded sub streams.  The common analogy is to think about a series of machines that communicate with conveyor belts, each with its own inputs and output ports.  Designs should be oriented to data transformations and filtering.  Since data between each process is buffered, asynchronous operation is achieved, freeing the developer from additional logic to handle it. 
Another interesting idea is that bypassing a process is trivial, and so is storing intermediate steps. 

## Information packets ##

Information packets are in constant debate, but at the end of the day it depends on the application domain.  The general consensus is that the packet should carry data that is serializable and passive in its nature.  Sending an instantiated Video Player in a packet is an example of what should not be done, and instead sending the individual frames would be the correct approach. 
The packet should contain a reusable data type, and depending on the implementation, allow for features like adding dictionary entries with other packets as values, attaching packets as siblings forming tree structures, ownership to stop other processes from altering a packet, schema for validating packet data, etc.  

### Initial information packets ###
In a Graph , each Process can have several Initial Information Packets that serve as configuration.  They do not get pushed into a port until the process issues a RECEIVE or READ on that port.  Think of them as passive packets. 

### Activation ###

A Process is activated when it has incoming packets on its input ports, an exception of this would be a Start component in some implementations that is designed to be started on Graph activation and it forwards the IIPs attached to it. 
IIPs should not activate a process, although some implementations do. 


## Connections ##

Connections are bounded buffers between ports, and their size is in number of packets.  When they fill up the sending process doing the SEND blocks and when they are empty the receiving process doing a READ blocks. 

### Merging ###

When two or more ports need to be connected to a single input port some form of merging has to take place.  Either with a Merge component with multiple inputs, that outputs through a single port, in order or arrival or in order of array port reading.  Automatic merging can be also provided by the library. 

### Splitting ###

When a single output port needs to be connected to multiple input ports , the packets need to be split like in a water flow, so in order to achieve this a component that splits packets is needed.  It should create a copy of the packet and send it to each connected output.  The runtime can provide this functionality without the need of an explicit component to do this and it comes down to preference.  Morrison encourages the use of an explicit Split component. 

## Graphs ##

Flow Based Programming uses Directed Graphs to represent the structure of the programs.  Nodes are processes ( instances of a component ), and the edges are the connections between ports.  
Outputs can only be connected to Inputs. 
A graph is built as a static view of the program , that is ran with the help of a library. 
Several tools are being built for editing graphs, and they can either be built via a visual tool like Draw FBP, NoFlo, or with textual Domain Specific Languages. 
A graph can be embedded in another graph as a process if it exposes external ports connected to its internal processes. 

### External ports ###

When creating a graph that can be embedded in another graph the graph designer will expose external ports, and they will be input or output ports to provide connections to its internal processes. 
Creating new components from existing components is encouraged. 

### Feedback loops ###

FBP allows loop topologies in networks.   This can be useful for situations where the results of some process are fed back to serve as further input, e. g.  some interactive applications, but also applications like bill of Materials Processing, where components are successively broken down to subcomponents, until a level is reached where no further breakdown is possible, at which point the breakdown results are removed from the loop. 

One other situation which might involve a loop is where a process is used in "subroutine mode" - i. e.  the "caller" does a `send`/`receive`, and the "callee" does a `receive`/`send`.   This can be useful as it does not preclude the "callee" from being used in a "streaming" mode in other apps, or elsewhere in the same app.  

This topology does introduce one additional complexity:  the FBP closedown rule states that a process closes down when all of its upstream processes have closed down.   However, in a loop topology all processes are "upstream" of all the others, so at least one process has to take responsibility for closing down the network - the standard technique is for it to close its input ports and terminate, which then results in the rest of the loop closing down. 

In FBP we normally do not allow an output port of a process to be connected to an input port of the same process, a the chances of deadlock are very high.   However, this could work theoretically if done very carefully. . .  

## Flow features ##

This section covers aspects of how applications work in general. 

### Process lifetime ###

A process that has a long life is usually called a "looper" (not to be confused with "loop topologies", described above) because it loops through its input ports several times during its life, and tends to shutdown with the graph itself.  On the other hand, processes that have a short life are used like subroutines, they perform a task and then deactivate, and they are called "non-loopers". 
Making a distinction about what kind of component we are designing or implementing is important to avoid complex or resource intensive processes when not needed.  For example a component that checks for new emails on an account could either behave like a looper, checking e-mail every minute and keeping a connection alive, or as a non-looper simply checking for e-mail when requested and closing any connections after retrieving the messages. 
