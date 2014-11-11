#Design goals of Antha

The guiding philosophy of Antha is to bring the benefits of modern programming 
practice to the practice of biological experimentation. There are many innovations
which are widely used in the software community that are not available to biological
experimenters but which would bring enormous gains in productivity. 

The Antha language has therefore been designed with the following princples in mind: 

##Emphasise Readability

A core purpose of the Antha system is to establish a *de facto* standard language for 
defining protocols and parts for use in biological experimentation. Therefore it is 
designed to mask some of the programming detail from the user and focus on the 
biology.  

It is also important to consider the needs of the wider community: for a language to 
serve as a vehicle for precise scientific communication it is preferable to avoid
giving people the chance to write in widely divergent styles. The section-based format
is aimed to make the important principles of the protocol such as its inputs, outputs
and purpose, able to be read at a glance, and the language is deliberately restrictive
in its syntax. The focus on function and purpose as opposed to implementation is another
feature which helps to make protocols more readable. 

Additionally the use of a structured, text-based format with a domain specific vocabulary
permits the use of version control systems to track how protocols evolve and change over
time and identify which changes are responsible for particular behaviour and avoid repeating
mistakes. 

##Concurrency Is Central

Biology is complicated. The number of experiments required to characterise and define 
even simple systems robustly can easily amount to hundreds. The way Antha defines protocols
is intended to make scheduling huge numbers of experiments to run in parallel essentially
the same process as defining a single run. 

An Antha protocol is intended to define the series of operations to be performed on a
single experimental sample. These samples can be replicated or run with varying parameter
values to define a larger-scale experiment. The scheduling part of the execution environment
can then determine which currently running protocols have similar requirements and improve
efficiency by running them together. This allows automated systems to be used with maximum 
efficiency.

##Define **What** Not **How**

Typical biological protocols are full of implementation details and it takes a great deal of
expertise on the part of the user to know which steps are critical and which could be done
differently. Very often the purpose of each step is difficult to determine and it takes a lot
of experience to get some techniques right. This leads to situations where labs lose techniques
when particular members leave and it is difficult to identify why particular results cannot be
reproduced. 

Antha aims to rectify this in two ways: execution details are generally omitted from protocols
and in many cases certain precise information will only be available when the protocol is run. 
Criticial constraints can be expressed as constraints to the system, however the Antha style
is to leave implementation details for the scheduler to decide. This means the purpose of the
steps stands out much more from the implementation details. 

Secondly by recording protocols in a standard, executable form and tracking everything (see below)
once protocols are created they can be used again and again without needing to know anything but
how Antha will interpret the protocol. 

##Facilitate Quality

Software design has benefitted hugely from the advent of test-driven and behaviour-driven design
approaches. Best practice in software design emphasises development of code as comprising multiple 
unit operations and defining their behaviour with tests which encompass how they should perform
given certain inputs. 

Although it is not directly enforced, the design of Antha is intended to make workflows act as
a set of simultaneously running services, each providing a particular part of a protocol, essentially
defining unit operations. 

For testing, Antha defines a Validation section whose aim is to provide a series of tests which any
protocol must pass to be defined as having succeeded. That way users can know if a particular step
is a problem and protocols which repeatedly fail validation tests can be marked as unsafe. 

##Record Everything

It's easy to forget small steps in protocols and painful to have to write everything down afterwards. 
Antha is designed to track all operations and specific inputs on samples automatically, saving 
time and sanity while facilitating quality.

##Catch Mistakes Early

Antha makes use of the idea of strong variable typing to help ensure that protocols make sense, 
particularly when linked together. That means you can't tell a liquid handler to pipette 4g of
a solid or set a thermostat to 20ul. The unit system helps to prevent numerical errors by handling
relevant conversions for you. Simulation is also used extensively for runtime checking and predicting
execution times.
