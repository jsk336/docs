---
layout: default
type: api
navgroup: execution-api
shortname: liquidhandler-interface.md
title: liquidhandler-interface.md
executeapidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: liquidhandler-interface.md
  description: the interface and communication structures for liquid handling requests
---
# Liquid Handler

The liquid handler provides a unified, logical interface to define liquid handling requests. 

The device defines operations to allow higher- and lower-level control over behaviour as well as querying device state and changing device parameters. 

It is up to a particular liquid handler to determine how these requests are to be implemented, however the ordering of requests in the queue must always be respected. 

Although it is possible to directly request single operations, a single request usually encompasses a set of steps. 
Request groupings are always ordered and can be labelled with bounds on execution time and other scheduling features. 

As it stands, the system does not have explicit instructions for when to execute requests but simply executes as soon as it has met the required conditions. This requires talking to the sample and stock managers to determine when each object is in its required location. 

    Mix(LiquidHandlingRequest)
     - perform liquid handling movements according to this scheme
    Ready() bool
     - is the device free?
    TimeToReady() time
     - when will the device next be free?
    SetParameters(LiquidHandlerParams)
     - set parameters accordingly
    GetParameters() LiquidHandlerParams
     - get the current parameters 


   
