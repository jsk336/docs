---
layout: default
type: start
navgroup: docs
shortname: Anatomy
title: Functional Access to DNA Sequences
---

## Antha models of genetic parts##

As part of Antha's goal of abstracting the complexity of biology, it is able to encode genetic parts along with metadata or models of their function.  This enables biologists to think about the function of the part they are looking to incorporate, not the raw ACGTs.  Given the level of context sensitivity of genetic parts, this will ultimately allow computational expression of how genetic factors interact with each other and environmental conditions in a given host strain.

## Simple example: encoding the [Anderson promoter library](http://parts.igem.org/Promoters/Catalog/Anderson)##

To exemplify the way Antha can be used to code genetic parts, we here show how the Anderson promoter library can be coded into a single script.  The script requires a desired relative promoter strength as an input, and uses a binary search to return the closest genetic sequence.  At present, and in the absence of further characterisation of these parts, the script makes no provision for how the output of these promoters may change with expression conditions.

Header and script imports:

```go
// Example smart promotor protocol.
// Parametizes access to the Anderson promotor library.
protocol promoter
import (
	"sort"
)
```

Then we need some Parameters (input data)- in this case it's just the strength(s) of promoters we want returned...

```go
// Input parameters for this protocol (data)
Parameters {
	var PromoterStrength  = 0.50
}
```

...then we define the types of what'll be returned.

```go
// Data which is returned from this protocol, and data types
Data {
	var PromoterSequence DNASequence
	var PredictedStrength float64
}
```

The setup section details all the preparatory steps for an element- in this case, all we need to do is sort the list, as it's just been taken directly from the web and is unordered in its raw form (see below).

```go
// Requires the collection of sequences to be sorted
Setup {
	sort.Sort(collection)
}
```

Right, now lets get to the heart of the issue- the Steps section defines what the element actually does.  In this case it defines the collection...

```go
Steps {
	seq := collection.GetClosest(PromotorStrength)
	PromoterSequence = seq.Seq
	PredictedStrength = seq.Str
}

// Simple data structure to associate sequences and strengths
type andersonSequence struct {
	Seq string
	Str float64
}

// Simple type to describe anderson promoters
type andersonCollection []andersonSequence

// Current Anderson Promoter collection
var collection andersonCollection = andersonCollection{
	{Seq: "ttgacggctagctcagtcctaggtacagtgctagc", Str: 1.0},
	{Seq: "tttacagctagctcagtcctaggtattatgctagc", Str: 0.70},
	{Seq: "ttgacagctagctcagtcctaggtactgtgctagc", Str: 0.86},
	{Seq: "ctgatagctagctcagtcctagggattatgctagc", Str: 0.01},
	{Seq: "ttgacagctagctcagtcctaggtattgtgctagc", Str: 0.72},
	{Seq: "tttacggctagctcagtcctaggtactatgctagc", Str: 0.24},
	{Seq: "tttacggctagctcagtcctaggtatagtgctagc", Str: 0.47},
	{Seq: "tttacggctagctcagccctaggtattatgctagc", Str: 0.36},
	{Seq: "ctgacagctagctcagtcctaggtataatgctagc", Str: 0.51},
	{Seq: "tttacagctagctcagtcctagggactgtgctagc", Str: 0.04},
	{Seq: "tttacggctagctcagtcctaggtacaatgctagc", Str: 0.33},
	{Seq: "ttgacggctagctcagtcctaggtatagtgctagc", Str: 0.58},
	{Seq: "ctgatggctagctcagtcctagggattatgctagc", Str: 0.10},
	{Seq: "tttatggctagctcagtcctaggtacaatgctagc", Str: 0.15},
	{Seq: "tttatagctagctcagcccttggtacaatgctagc", Str: 0.16},
	{Seq: "ttgacagctagctcagtcctagggactatgctagc", Str: 0.06},
	{Seq: "ttgacagctagctcagtcctagggattgtgctagc", Str: 0.56},
}
```
...then does a binary search to find your ideal match.  It's like a dating site, just for small stretches of DNA instead of eligible humans. 
```go
// Utility function to support golang sort
func (slice andersonCollection) Len() int {
	return len(slice)
}

// Utility function to support golang sort
func (slice andersonCollection) Less(i, j int) bool {
	return slice[i].Str < slice[j].Str
}

// Utility function to support golang sort
func (slice andersonCollection) Swap(i, j int) {
	slice[i], slice[j] = slice[j], slice[i]
}

// Simple function to search for the closest characterized sequence.
// Note: this does not currently take into account any additional factors
// that could impact the promotor strength, and is simply intended as an example
func (slice andersonCollection) GetClosest(str float64) andersonSequence {
	// If the requested strength is greater than any known sequence, return the strongest
	// known sequence
	if str > slice[slice.Len()-1].Str {
		return slice[slice.Len()-1]
	}
	// do a binary search of the known characterized sequences to find the best match
	pos := sort.Search(slice.Len(), func(i int) bool {
		return slice[i].Str >= str
	})
	// return the sequence details
	return slice[pos]
}
```