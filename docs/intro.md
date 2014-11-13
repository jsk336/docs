---
layout: default
type: start
shortname: Intro
navgroup: start
title: Introduction to Antha
---

<style>
#download-button {
  background: #4285f4;
  color: #fff;
  font-size: 18px;
  fill: #fff;
}
#download-button:hover {
  background: #2a56c6;
}
#download-button::shadow paper-ripple {
  color: #fff;
}
</style>


{% include toc.html %}

# Learn Antha #

## Making biology simple, reproducible and scalable ##


There is still a huge problem of reproducibility in the biosciences. Unfortunately it is often not as routine as you might think to replicate work reported in the scientific literature, or even work in the same lab by the same person (yeah you!). 
A [report](http://www.nature.com/nbt/journal/v27/n1/full/nbt0109-26.html) in Nature in 2012 reported that scientists at Amgen managed to reproduce only 11% of 53 cancer-related studies which they'd attempted over the years. Shocking! but unfortunately this is fairly typical and needless to say the cost of this to society is likely to be staggering. With this background, can we really standardise biology and build complex systems as we intend to in the synthetic biology community?

Driven by our in-house needs and what we've learnt through statistical experimentation, automation and advances in the tech sphere, we've come to understand that the whole way in which experiments are designed and recorded needs to fundamentally change in order to solve this problem. The answer... Antha

## Redesigning the language of biology ##

Antha is the first high-level programming language for biology; designed to make simple, reproducible and scalable workflows by stacking smart and reusable elements.

An element can be anything from genetic elements (such as a promoter, ribosome binding site, transcription factor, host cell) to experimental procedures such as DNA assembly, incubation, protein expression or enzyme assays. 

<img src="/images/Individualelement.png" alt="An individual element" title="An individual element" width="100" height="100">

Antha will automatically track and log all associated data when the element is executed. Essentially this enables not just the standardization of the genetic parts but standardization and full tracking of the experimental procedure used to characterise. This will inherently allow for greater reproducibility, simplicity and scalability when the elements are wired together to form workflows. Once elements and workflows are designed and tested they can be shared or even embedded as a downloadable and executable material and methods section of a research article.

<img src="/images/antha-workflowfull.png" alt="An Antha workflow" title="An Antha workflow">

Experiments can then be generated from bundling workflows together. Potentially designed, scheduled, executed and processed in response to **what** the experimenter wants to find out, leaving the **how** to be abstracted from the user if desired.

<img src="/images/antha-workflowstack_small.png" alt="An Antha experiment" title="An Antha experiment">

## Quality built-in ##

Antha is an end-to-end fully integrated language with quality control built in to its DNA. As well as a language for experimental design, execution and data processing, it’s a LIMs system, data-management system and QA system, yet simple and fun to use. The language is designed to effortlessly incorporate quality standards such as quality by design and GMP level quality standards without the overhead for the user. This means enhanced traceability, reproducibility and simplicity for the user.

There are many factors which can affect an experiment which typically wouldn't be recorded. With the example of a simple step such as recovering a frozen cell stock and incubating there are many factors which might effect the reproducibility and quality of the procedure which could have a knock on effect in subsequent processes. Normally it would be very laborious to capture all of these variables but Antha aims to capture as many of them as possible automatically. 
<img src="/images/Antha_seedelement_sourcesofvariability.png" alt="sources of variability" width="100" height="100">

Because of the abstraction and modularity of Antha, it can potentially be the design and processing tool for experiments carried out on any instrumentation; manually or automated. 
The scheduler will figure out the most practical and robust strategy for executing the experiment so the experimenter can focus on what they want to do rather than how they do it. 

## Next steps {#nextsteps}

Continue on to the core concepts documentation: 

<a href="/docs/index.html">
  <paper-button raised><core-icon icon="arrow-forward" ></core-icon>Core concepts</paper-button>
</a>
