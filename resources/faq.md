---
layout: default
type: resources
navgroup: resources
shortname: Resources
title: FAQ
---


{% include alpha.html %}

*Don't see an answer to your question on here? Ask on the [mailing list](/discuss.html)!*

{% include toc.html %}

## {{site.project_title}}

### Why should I care about this project? {#why}

{{site.project_title}} is the first high level language designed to enable robust, reproducible and composible work in the biosciences. {{site.project_title}} is built on top of established technologies including Go, CouchDB, MORE TEXT HERE.

### Is {{site.project_title}} production ready? {#readiness}

{{site.project_title}} is currently in "community preview." Many of the pieces that are being integrated into {{site.project_title}} have been in production use at Synthace and other organisations for years. However, the full integration into {{site.project_title_}} is new and will inevitably uncover bugs in the component pieces it has brought together.

### What sort of testing do you do?

{{site.project_title}} uses Chromium's continuous build infrastructure to test
the entire system and each polyfill, individually. See our [build status page](/build/).

## Data Access

### What format does Antha produce data in? {#openData}

{{site.project_title}} translates the proprietary formats of the various devices accessed as part of the process of 
experimeent execution into open JSON based data. The original proprietary format inputs are also captured for archival purposes if
you like those sorts of things.

## Antha Elements

### How do I package a bunch of custom elements together? {#packaging}

Antha Elements follow the same packaging structure as GO packages. [Golang](https://code.google.com/p/go-wiki/wiki/PackagePublishing)

---
