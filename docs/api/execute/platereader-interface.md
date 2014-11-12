---
layout: default
type: api
navgroup: execution-api
shortname: platereader-interface.md
title: platereader-interface.md
executeapidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: platereader-interface.md
  description: the runtime interface to a platereader
---
# Platereader

Interface which defines a service for measuring absorbance, fluorescence or emittance. 

We anticipate that many devices may not be externally programmable via a serial or equivalent interface, instead offering only the option to run protocols pre-programmed via a separate interface. 

In order to deal with this we may implement a back-end system in which there is a list of such protocols and relevant parameters, if a particular protocol cannot be found the user must be notified and asked to take appropriate remedial steps - writing a protocol or changing the request. 

     Read(PlateReaderRequest) chan *PlateReaderResult
      - Acquire the appropriate reading from one or more samples. 
        The request structure parameterises the specific sample.
        The return is a channel which will emit a result structure.
