---
layout: default
type: api
navgroup: execution-api
shortname: scheduler-interface.md
title: scheduler-interface.md
executeapidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: scheduler-interface.md
  description: the interface to the runtime scheduler
---
# Scheduler

The scheduler maintains a queue of requests for actions to be taken.

Requests are parameterised with serializable map functions defining what type of request is being made and its parameters. 

     Submit(Request)
         - add a request to the queue
     Delete(RequestID)
         - delete a request from the queue
     Alter(RequestID, Request)
         - alter a request in the queue
     List(Filter) []Request
         - retrieve a list of requests currently queued, optionally filtered 
