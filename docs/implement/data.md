---
layout: default
type: implement
navgroup: docs
shortname: data
title: The Antha Data Model
docs:
  published: 2014-11-14
  antha_version: 0.0.1
  description: How Antha organises data.
---
{% include toc.html %}

# Data is key to insight

At the heart of any scientific investigation is the data collected.  All measurements, values and information relating to an experiment need to be collected and stored.  It is essential that the data storage is reliable, unambiguous, accessible, and processable.  With advances in technological innovation, high-throughput instrumentation and automation the rate at which data is generated is growing rapidly and data management is key to true understanding. 

## Storing data

Databases provide a means to store, manage and access a collection of data.  A data model is used to describe the structure of the information recorded within the database.   

For example, if you wanted to store data in an excel file you would set up a spreadsheet with columns for each variable of interest and each data entry would be a row in this spreadsheet.  Storing data this way means that you need to store information about each column for each row.  What if the you wanted to add a new attribute - what happens to the existing rows?  

Due to the diverse nature of biological and experimental data and the continuous development of the scientific process, Antha requires a dynamic, flexible data model capable of managing unstructured data.   

To achieve this the Antha data model is document-orientated.  This approach supports the management of semi-structured data and allows the data (or document) structure to evolve dynamically and incorporate new attributes as necessary.  

### What are documents?

Just like 'real-world' documents, database documents describe objects within the system and can be thought of as records of that object.  They describe a self-contained unit of data - storing everything that is needed to describe that object together in one place.  A document may be used to describe anything and it may contain anything.  It may consist of as many uniquely named fields (or components) as required and the values for those fields may contain any type of data (e.g. strings, dates, numbers, lists or even embedded documents).  Documents describing the same type of object will contain the same sort of information (they will have field names in common), but the structure of that information may vary (one document may contain additional field name entries that may be missing in another document).  

Antha stores data as JavaScript Object Notation (JSON) documents within a [CouchDB database](http://couchdb.apache.org). 
    
While no structure is enforced on Antha documents, some structure is defined by the attributes or features required to describe an object.  As an example a reagent could be described as follows:

```
    {
	"id": "Unique_ID_1234",
	 "_rev": "12345678910",
	 "type": "reagent"

	 "name": "reagent_A",
	 "amount": 1.0,
         "base": 4.0,
         "units": "uL",
         "stock_level": 50,
         "preparable": true
    }
```

This document describes the attributes of a specific reagent inventively named "reagent_A".  In this example the reagent is characterised by the "amount" of stock sample used (a separate field describes the "units" of measurement), the amount of stock remaining ("stock_level") and whether or not the reagent can be prepared if required ("preparable").  In addition to the field entries discussed above, this document also contains fields describing the ID of the document which is used to uniquely define the document (or specific reagent in this case) and a field for the revision ID (_rev) detailing the version of the document (this will be discussed in more detail below).  The field name "type" can be used to describe a group of related documents (e.g. link all documents describing reagents) and is used to create views (discussed below). The "type" can be also used to apply validation on data as it is added to the database if required.

As a second example, we consider a 96 well plate, this is an instance of a labware object and can be described as follows:

```
    {

	"id": "Unique_ID_5678",
	"_rev": "12345678910",
	"type": "reagent"

	"labware_id": 1,
	"barcode": "12345",
	"name": "Component Plate",
	"type": {	   
		"id": 1,
                "name": "96 Deep Square Well Plate"
                },
        "stock_level": 423
    }
```

## Accessing information  

### Using views

Views provide a way of querying the database. A view is essentially just a javascript function which selects particular documents and defines how to assemble the results into some kind of output. This may be raw output or it could be a summary of a set of raw outputs. Views often have two components, a map function which returns a set of raw results and a reduce function which aggregates the raw values into a summary output. For instance the levels of all stocks of a particular type in the system could be produced by first searching for all stocks by type then passing the resulting records to a reduce function which simply sums the available levels of each. Reduce functions can then be used on previously reduced outputs to produce further transformations on the output data. 

### Updating documents 

When a document needs to be edited or updated the changes do not happen in-place.  Making changes to a document involves retrieving the full document, editing the JSON structure and saving the new version of the document under a new revision number.  Even deleting a document involves creating a new revision.  The database will contain both the original copy of the document and the updated version until a compaction or replication process is run.  Revision numbers provide a way of managing update conflicts.

### Replication

A backup of all existing data is maintained by replication of the database.  Replication allows for the synchronisation of two copies of a single database, a noted strength of CouchDB.  In CouchDB the replication procedure involves comparing the two copies of the database (source and destination), identifying documents which differ between the databases and transferring those documents to the destination database.  Thus ensuring that the data is consistent in both copies of the database.  Copies of the database can be local or remote.  This offers the opportunity to maintain a local database (which is always available) and to backup to a remote database when a network connection is available.  As Antha uses a CouchDB database it supports continuous database replication.  A replication task transfers changes in one direction (from source to destination) it is also possible to setup master-master replication in which the replication occurs in a bi-directional manner.  This allows changes in either database to be mirrored.  

## Sample Tracking

The CouchDB document model provides a natural method for keeping track of how samples progress through the system. Since documents are immutable all previous versions of a sample are accessible for full traceability. The lack of a pre-defined schema means that the document's structure is free to adapt to whatever has occurred within the lifetime of the sample. 

## More info?

For more information regarding Antha please refer to [the documentation](/docs/index.html) section.  If you want a more details about the database used by Antha see the [CouchDB documentation](http://couchdb.apache.org).