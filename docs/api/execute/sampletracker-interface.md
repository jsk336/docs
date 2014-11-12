---
layout: default
type: api
navgroup: execution-api
shortname: sampletracker-interface.md
title: sampletracker-interface.md
executeapidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: sampletracker-interface.md
  description: the runtime interface to the sample tracking service
---
# Sample Tracker Interface

The sample tracker has the following responsibilities: 

* Create, read, update, delete sample records

It therefore needs to provide the following methods: 

    Create(id GUID) Sample 
    - generate a record for a new sample. 
      The id can be nil, in which case SampleTracker will assign one. 
      The specified id may be overwritten. 

    Read(id GUID) Sample 
    - retrieve the most recent sample record with this id. 

    Update(id GUID, sample Sample) 
    - post the new record to the sample. 
      Since records are immutable this has to be an overwrite operation.

    Delete(id GUID) 
    - delete the sample record with the specified id. 
      Since records are immutable this is likely to be a no-op, 
      but this may mark records for archiving. 
