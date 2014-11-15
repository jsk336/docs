---
layout: default
type: implement
navgroup: docs
shortname: Devices
title: Device Drivers in Antha
---
{% include toc.html %}

# Devices

There are typically many devices involved in any experiment carried out in an average laboratory: freezers, incubators, analytical equipment, liquid handling robots, PhD students. Antha must be able to speak to and coordinate operations with all of these in order to properly integrate workflows and capture all associated data. Antha is designed to directly communicate with devices but also to support manually executed protocols. Outputs can be specified as human readable forms of protocols such as recipe sheets, material and methods sections or electronic guides, which can be executed step-by-step through a tablet of laptop interface.

## Support for redundancy and risk mitigation options

Laboratory automation doesn’t always go smoothly and if not designed well one problem can [bring everything to a halt]( https://www.youtube.com/watch?v=n_1apYo6-Ow). To confront this Antha will natively support options to mitigate for this by building in the potential for redundancy and risk mitigation based on managing both the probability and magnitude of consequence (i.e. how bad would it be if the step fails).

## Sensing, barcodes and mobile device app support

Typically scientific laboratory solutions are expensive but often existing apps and features of the smart phones we all have could perform tasks just as well, potentially for a fraction of the cost. Antha will support interaction with such systems to make performing the experiments and adhering to high quality standards as easy for the user as possible. This might include smartphone apps to conveniently read reagent barcodes which will automatically track the exact batch details of items used. Meaning the user doesn’t have to waste time transcribing or leaving out the all important details which are needed to capture issues such as batch to batch variation; a very real issue which has long been known to big pharma.
