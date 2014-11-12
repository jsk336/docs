---
layout: default
type: api
navgroup: execution-api
shortname: stockmanager-interface.md
title: stockmanager-interface.md
executeapidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: stockmanager-interface.md
  description: the runtime interface to the stock manager
---
# Stock Manager Interface

The stock manager maintains information on what stocks are locally available.

This is mostly a CRUD tool; additionally it needs to track the location and physical state of stocks.

In the first instance the objects traded by these are maps from strings to properties with no enforced schema. The closest we can get is to have a set of reserved keys which, when used, must be used in a particular way.

e.g.

              id: guid   -- the globally unique identifier for 'this'
        location: guid   -- the guid for the storage location 
        material: string -- what type of stock this is
        solvent : string -- if a solution, what is it dissolved in?
   concentration: float  -- if a solution, what is its concentration in Mol/L
          volume: float  -- what is the volume of this sample

more definition on this at [[reserved keys|reservedkeys]].

The stock manager must be able to keep track of where each of its entities is. A key responsibility is to maintain the correct relationship between separate stocks stored, e.g., in the same physical entity - if several are stored in a microplate, for instance, they cannot be separated without liquid handling. 

Implements the following functions: 

    CreateStock(Stock, Store) 
      - creates a new stock entry; 
        optionally takes some information on how to store it

    FindStock(Stock) []Stock
      - search function: attempts to find any stocks which satisfy the 
        information provided as a stock object
        e.g. if the stock object only defines {name: "tartrazine"} FindStock 
        returns all stocks with that name field. 

        // if we do things this way we need to define some keys to represent 
        // search parameters, 
        // e.g. minVolume: 3.0 etc.

    GetStock(Stock)
      - retrieve information on stock object in question

    PutStock(Stock)
      - update the information on the relevant stock
