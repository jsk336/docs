---
layout: default
type: start
navgroup: docs
shortname: Anatomy
title: Functional Access to DNA Sequence
---

{% include toc.html %}

functional sequence here

```go
// Example smart promotor protocol.
// Parametizes access to the Anderson promotor library.
protocol promoter
import (
	"sort"
)

// Input parameters for this protocol (data)
Parameters {
	var PromoterStrength  = 0.50
}

// Data which is returned from this protocol, and data types
Data {
	var PromoterSequence DNASequence
	var PredictedStrength float64
}

// Requires the collection of sequences to be sorted
Setup {
	sort.Sort(collection)
}

Steps {
	seq := collection.GetClosest(PromotorStrength)
	PromoterSequence = seq.Seq
	PredictedStrength = seq.Str
}

// Simple data structure to associate sequences and strengths
// TODO: Update to appropriate Antha types
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