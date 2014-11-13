---
layout: default
type: api
navgroup: execution-api
shortname: execution-api.html
title: execution-api.html
executeapidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: execution-api.html
  description: General description of API with links
---
# Execution API page

The execution context structure is globally accessible and allows all services a channel by which they can talk to other services. 

The following service interfaces are required: 

* [SampleTracker](sampletracker-interface.html) : CRUD tool for talking to database of samples in system
* [StockManager](stockmanager-interface.html) : CRUD tool for talking to database of stocks 
* [Logger](logger-interface.html) : Simple logging daemon
* [Scheduler](scheduler-interface.html) : Handles requests for movement, liquid handling and other device interaction
* [GarbageCollector](gc-interface.html) : Holds a reaper queue

Additionally, the execution context must hold the following channels, which should only be accessible directly by the scheduler 

* [LiquidHandler](liquidhandler-interface.html) : Logical interface for requesting any kind of liquid handling operation
* [Mover](mover-interface.html) : Logical interface for requesting movement of entities
* [Platereader](platereader-interface.html) : Logical interface to spectrophotometry
* [Store](store-interface.html) : Logical interface to storage devices
