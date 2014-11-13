---
layout: default
type: start
navgroup: docs
shortname: Anatomy
title: Structure of Antha elements
---

{% include toc.html %}

Antha elements are the unit operations that make up biological research.  Each of them takes inputs of materials and data, puts them through a highly defined process, and returns material products and data outputs.  An element is made up of multiple defined sections that define these features.  

Antha elements define the fate of a single sample at a time, but are engineered to allow massively parallel execution so that as many samples as are required can be run concurrently.

## Imports##
Element name and additional Antha elements and go code needed for execution.

## Parameters##
Input parameters needed for this protocol.  Defaults are defined in the script, but these will be overridden by any parameters that come in from the user or a preceding Antha element.  This means that any script will run by itself, but you can change any subset/all of the parameters as you want.

## Data##
Output data resulting from this protocol.  These can be wired into subsequent elements.

## Inputs##
Material inputs (reagents, solutions and labware) needed to execute, will often be products of previous elements.

## Outputs##
Materials that result from the processing of the inputs (can be inputs for other elements).

## Requirements##
Pre-validation of inputs- what criteria must the physical inputs meet in order to allow the element to execute.

## Setup##
These are the tasks that must be performed the first time an element is run in a set of experiments.  For example, the first time an assay is run, a calibration curve for that assay is run.

## Steps##
This is the heart of the element, which defines the physical actions that need to be performed to achieve the goals of the protocol.  

## Analysis##
The analysis section defines all the computational steps that need to be performed on the results from the steps section to generate the final output Data.

## Validation##
What analysis needs to be done to check the element has run as scripted.

## ...and finally, what *isn't* in here##
As Antha is designed as a high-level language, it deliberately doesn't include details of what kit it needs to be run, or detailed specifics of e.g. what goes in which well.  This means that it can be run on any kit with the required functionality, or by hand.  The adaptation of instructions here is done in the execution environment, i.e. the scheduler and device drivers.  


