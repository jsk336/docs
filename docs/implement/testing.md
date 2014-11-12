---
layout: default
type: implement
navgroup: docs
shortname: Testing
title: Unit Testing in Antha
---
{% include toc.html %}

## Unit Testing and Quality

One of the key goals for Antha is to facilitate the development of quality protocols
which can be validated against particular standard outputs to determine whether they
have executed successfully. 

This is intended to be analogous with the process of unit testing in software development. 
Developing tests to identify when a particular piece of code is behaving as expected has
many benefits: in the first place it requires the author to specify all of the required
behaviour upfront, providing an authoratitive definition of the function of a particular
operation. 

Secondly and more importantly it provides a mechanism to identify when changes within the
code or its dependencies have introduced errors. This greatly facilitates troubleshooting
a highly complex software system and prevents many errors from propagating and producing
unexpected behaviour. Tests are run automatically every time the software is built into
an application, providing immediate error checking.

There is a strong similarity between these concepts and the kinds of quality control 
procedures which are usually adopted for clinical assays. While there are some domain
differences the basic idea of determining the limits of validity of a process is very similar.

## Unit Tests For Antha Protocols

The Antha language defines unit tests using the validation section, which is a standard
part of any protocol. The intention of this is for the protocol to be tested against
particular criteria every time it is executed on new material. 

An example of this can be seen in the Bradford example protocol: the standard curve of 
protein concentrations is required to meet certain linearity requirements for the 
result of the assay to be considered valid. 

The Antha validation section provides the system with information on the status of 
any particular run, allowing tracing of problems identified later. Additionally the
results of properly designed validation checks run repeatedly on the same protocol
with different inputs can provide significant information on its reliability across
the space of its possible inputs. 

This helps to address one difficulty with the application of unit testing to this
domain: in principle it is necessary to design unit tests for software to test the
full range of possible inputs including all edge cases. The difficulty of this in 
the biological domain is that this could be extremely expensive and time-consuming,
perhaps not even possible depending on the exact inputs. Running validation checks
for every run in addition to the characterization information which will be required
to register a new part or protocol is an important step towards fully identifying
how protocols can be made robust and truly general.

