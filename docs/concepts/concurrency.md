---
layout: default
type: concepts
navgroup: docs
shortname: Concurrency
title: Concurrency in Antha
docs:
  published: 2014-11-14
  antha_version: 0.0.1
  description: What is concurrency, why it is hard, and how Antha has been designed to help manage it.
---
{% include toc.html %}

# Concurrency

Concurrency is hard, at least in most programming languages. The Go language has the ability to execute processes concurrently and, critically, to coordinate concurrent processes efficiently. That’s why we chose Go as the basis for the antha language. 

## What is concurrency? 
Rob Pike, one of the pioneers of Go from Google, [explains](https://www.youtube.com/watch?v=cN_DpYBzKso) that concurrency is NOT the same as parallelism, it’s better. 

Concurrency = the composition of independently executing processes.

Parallelism = simultaneously executing processes.

What that means is that concurrency is about dealing with a lot things at once whereas parallelism is about doing a lot of things at once; concurrency is about structure; parallelism is about execution.

Concurrency is about structuring so MAYBE you can use parallelism to do a better job. But parallelism is not the goal of concurrency, concurrency’s goal is a good structure and good structure is key to managing complexity (like in biology)
In order to get concurrency to work though you have to add the idea of communication

Concurrency + communication = more efficient processes.

Communication enables the ability to coordinate those independent pieces for optimal efficiency, not necessarily doing things at the same time. This concept is not [new](https://assets.cs.ncl.ac.uk/seminars/224.pdf) but Google’s Go language has this capacity built-in making building qnd debugging concurrent workflows easier.

## Concurrency with Antha
Antha will bring the concept of concurrency into managing physical lab operations and processes with limited resources as well as computational tasks such as processing DNA sequencing data or metabolite profiling. 
In the computational sphere this can mean large operations are performed in seconds rather than minutes; in the physical world of carrying out lab work, where timescales are longer, the time saving could be substantial; especially as more ambitious experimental plans are enabled.
