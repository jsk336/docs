---
layout: default
type: api
navgroup: execution-api
shortname: execution-api.md
title: execution-api.md
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: execution-api.md
---
# Execution API page

The execution context structure is globally accessible and allows all services a channel by which they can talk to other services. 

The following service interfaces are required: 

* [SampleTracker](sampletracker-interface.md) : CRUD tool for talking to database of samples in system
* [StockManager](stockmanager-interface.md) : CRUD tool for talking to database of stocks 
* [Logger](logger-interface.md) : Simple logging daemon
* [Scheduler](scheduler-interface.md) : Handles requests for movement, liquid handling and other device interaction
* [GarbageCollector](gc-interface.md) : Holds a reaper queue

Additionally, the execution context must hold the following channels, which should only be accessible directly by the scheduler 

* [LiquidHandler](liquidhandler-interface.md) : Logical interface for requesting any kind of liquid handling operation
* [Mover](mover-interface.md) : Logical interface for requesting movement of entities
* [Platereader](platereader-interface.md) : Logical interface to spectrophotometry
* [Store](store-interface.md) : Logical interface to storage devices
