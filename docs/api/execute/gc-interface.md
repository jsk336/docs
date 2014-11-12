---
layout: default
type: api
navgroup: execution-api
shortname: gc-interface.md
title: gc-interface.md
executeapidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: gc-interface.md
  description: runtime garbage collection interface
---
# Garbage Collector

A service which holds a list of items to be recycled. 

Depending on the policies in place the actions to be taken could vary depending on the object type and state. 

The front-end is simply a post operation. Once sent to the garbage queue objects cannot be reclaimed!

The request requires a map structure defining the id of the object in question. 

    Bin(Entity) 
     - send the Entity named in the call to Valhalla
