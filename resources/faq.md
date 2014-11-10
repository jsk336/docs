---
layout: default
type: references
navgroup: references
shortname: References
title: FAQ
---

{% include alpha.html %}

*Don't see an answer to your question on here? Ask on the [mailing list](/discuss.html)!*

{% include toc.html %}

## {{site.project_title}}

### Why should I care about this project? {#why}

{{site.project_title}} is the first high level language designed to enable robust, reproducible and composible work in the biosciences. {{site.project_title}} is built on top of established technologies including Go, CouchDB, MORE TEXT HERE.

### Why do we need a high level language for doing biology? {#why}

A high level language enables ease of design, better reproducibility and scalability. Lack of reproducibility is still a major barrier to progress in the biosciences (an [article](http://www.nature.com/nature/journal/v483/n7391/full/483531a.html) from Amgen reports that they could reproduce findings in only 11% of 53 published papers). 

### Why is this only being done now? (needs editing)
The will to improve reproducibility is not new. In recent years efforts have been made to abstract the layers of biological complexity and to standardize by breaking down biological components into repositories of well-characterised standardized parts which can be combined to form more complex devices. The biobrick registry at iGEM is a good example of this. This is a move in the right direction but the problem is far from fully solved since biology is not that simple and often it's not possible to standardise parts.
The idea of abstraction and standardization are very welcome but unfortunately we don’t yet fully understand how even the simplest and most well-studied bacteria such as E.coli function… We know that the genome is 5.7million letters long and that about 4-5000 genes are produced but only around 66% of these genes have been experimentally verified. So how can we use a standardized parts based approach to building new microbes when we don’t fully understand how the operating system works? 
The answer may be to standardize the experimental format in which these parts are characterized, and capture all of the subtle artisanal details of a procedure not usually captured in a material and methods section of a research article.

Antha allows you to do this snd critically, the hard work is performed behind the scenes so GMP and QBD quality standards can be enforced but without the effort overhead. With Antha we can embrace the fact that we don’t fully understand the complexity of the biology and perform our characterizations reproducibly in a way in which new parts and devices are tested for robustness in the full genetic, biological and environmental context and to do so in a way where we design this approach to be performed by a liquid handling robot in which the characterisation process then becomes a software algorithm rather than a written material and methods section in a scientific journal, which has been the case up until now.  This approach would be a far more reproducible, scalable and robust way of standardization; not so dependent on a lab technician’s green fingers!


### What about Biocoder, SBOL, PrPr and Chris? {#why}

None of these are high-level languages capable of incorporating genetic design, experimental design, physical experimental execution and data processing.

### Is {{site.project_title}} production ready? {#readiness}

{{site.project_title}} is currently in "community preview." Many of the pieces that are being integrated into {{site.project_title}} have been in production use at Synthace and other organisations for years. However, the full integration into {{site.project_title_}} is new and will inevitably uncover bugs in the component pieces it has brought together.

### What sort of testing do you do?

{{site.project_title}} uses Chromium's continuous build infrastructure to test
the entire system and each polyfill, individually. See our [build status page](/build/).

### Why choose google GO as the basis?

Go is an open source language designed and built by Google to make building fast, simple and scalable software. Go is capable of concurrency and communicating directly with devices. Learn go [here] (http://go-book.appspot.com/index.html)

### How can I contribute to the language?
Absolutely, we welcome contributions to both the langauge itself and the building of elements. Sign up to the mailing list to stay up to date. 

## Data Access

### What format does Antha produce data in? {#openData}

{{site.project_title}} translates the proprietary formats of the various devices accessed as part of the process of 
experimeent execution into open JSON based data. The original proprietary format inputs are also captured for archival purposes if
you like those sorts of things.

## Antha Elements

### What is an element? 

### What sort of things can an element be?

### How small should an element be?

### How do I package a bunch of custom elements together into a workflow? {#packaging}

Antha Elements follow the same packaging structure as GO packages. [Golang](https://code.google.com/p/go-wiki/wiki/PackagePublishing)

### Where do all the low-level details go? Does it matter? 

### Can I integrate scripts from other languages such as Python or Matlab?

