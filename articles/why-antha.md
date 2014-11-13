---
layout: default
type: start
navgroup: docs
shortname: Articles
title: "Why Antha"
subtitle: Enhancing Bioscience Productivity

article:
  author: sward
  published: 2014-11-14
  antha_version: 0.0.1
  description: Enhancing Bioscience Productivity
tags:
- productivity
- reproducibility
- composibility
---

{% include authorship.html %}

{% include toc.html %}

At [Synthace](www.synthace.com) we engineer organisms and biological processes, because we don't see a better way than harnessing biology to solve the grand challenges facing humankind. The world economy is ultimately driven by biology, from the food we eat, to the medicines that keep us healthy, to the original sources of the energy that keep our cars and factories moving. However, the growing gap between our present capabilities to feed a growing worldwide population, to raise global standards of living, and to tackle emergent threats such as new diseases requires us to continue to get better at harnessing biology to address these global challenges.

Getting better at engineering with biology, however, is going to require profound changes in the way in which we approach the biological sciences. This is a lesson that we have learned the hard way over the past few years, as we transitioned from being a tiny team embedded in traditional academic thinking about how to do and progress scientific endeavors, to one that has lived solely by the quality of the engineering practices that we have had to develop.

## Lesson 1: Productivity Requires Reproducibility

The heart of that change was breaking how to make our work with biology more scaleable, in every sense of the word. To that end, we started with understanding why some protocols would work sporadically, even when we were attempting replication of high impact publications from major peer reviewed journals. Developing reproducibility in our working practices so that common activities -like assembling DNA or making modifications to various species of bacteria- worked all the time required that we develop our workflows out of individually testable, fully defined and fully characterized protocols. Suddenly, anybody in the lab could carry out any of our core protocols -no matter how complex- and our productivity immediately jumped.

## Lesson 2: Productivity Requires Codified Execution

Breaking our workflows down into reusable, individually tested and characterized Elements was necessary, but insufficient to truly scale the work that we do. Another key step was developing a way to enable our Elements to be executed more scalably, which mean shifting from using people to robotically move small volumes of fluids around, to using real robots. We also developed a way of writing our protocols that was independent of the specific type of robot running the Element, meaning that once an Element is fully defined, it can adapt to being executed in a variety of environments, from expensive Tecan Decks, to affordable new platforms like the [Gilson Pipetmax](http://www.gilson.com/en/Pipette/Products/75.290/Default.aspx) and the [Cybio Felix](http://www.cybio-ag.com/itid__571/).

Automating workflows, built using reusable, transferable Elements that can by run both by hand or on fully automated robot work cells meant yet another jump in productivity, and thus to being able to do more science to solve key real world problems. However, we then learned that you simply hit entirely new bottlenecks, primarily in how you manage the complexity of growing workflows and integrate and analyse the huge amount of data coming off a plethora of lab equipment.

## Lesson 3: Managing Complexity Requires Abstraction

We therefore realized that managing the information flow, and building device drivers that could turn the various streams of proprietary data coming off lab equipment into open formats that could automate the analysis, capture, and storage of that data was necessary as well. And, if you are processing data, you need the power of an entire programming language to turn that fire-hose of biological data into insight, and ultimately to solve real world problems.

Traditional data models build rigid schema, and are brittle to adaptation as the needs of systems change. In Antha, the workflow is the data model, with every input and output from every Element in a workflow automatically building the model for the entire experiment.  This has the added benefit of producing automated reporting for any experiment: the methods used are fully detailed in the workflow and the elements it's comprised of, and the results are the Data outputs from each script.

Ultimately, Antha allows the abstraction of complex experiments away from the details of each step, allowing biologists to focus on what experiment to run, and on gleaning knowledge from the data produced.