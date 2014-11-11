---
layout: default
type: start
navgroup: docs
shortname: Anatomy
title: Anatomy of an Antha Element
---

{% include toc.html %}

# Anatomy of an Antha Element #

functional sequence here

## Overview ##

Antha Elements are the How level of a process. They are designed to capture a single unit operation in an Antha workflow, with a defined set up physical and information inputs being processed into a defined set of physical and information outputs. In this example, the Antha Element defines a Bradford assay, which is a molecular biology assay used to quantify the amount of protein in a physical sample.

Syntax wise, Antha is an extension of the Go language (www.golang.org), and shares a focus on describing concurrent processes functionally. Any execution of a workflow is intended to describe a large array of parallel processes, and is described from the standpoint of the smallest appropriate unit of operation. In the case of this Element, that is the set of actions to process a single physical sample, even though this protocol will normally be run on arrays of samples at the same time.  

## Imports ##
```go
protocol bradford
import (
	"plate_reader"
	"github.com/sajari/regression"
	"standard_labware"
)
```
The Antha Element starts by defining a name for the protocol, in this case `bradford`, and listing what additional protocols or Go libraries are needed to execute the `bradford` protocol. The Antha compiler is smart enough to identify whether the imports are existing Go libraries, or other Antha Elements, and can be transparently imported directly from source code repositories such as [Github](http://www.github.com).  

## Parameters ##
```go
// Input parameters for this protocol (data)
Parameters {
	var SampleVolume Volume = 15.(uL)
	var BradfordVolume Volume = 5.(uL)
	var Wavelength Wavelength = 595.(nm)
	var ControlCurvePoints uint32 = 7
	var ControlCurveDilutionFactor uint32 = 2
	var ReplicateCount uint32 = 1 // Note: 1 replicate means experiment is in duplicate, etc.
}
```

The Parameters block defines the information inputs to the Bradford Element. Data types can be any of the built-in types from the Go language, such as `int, string, byte, float`, as well as the strongly typed scientific types introduced by the Antha language, such as the metric units. Parameter declarations follow the syntax of `var VariableName VariableType = OptionalDefaultValue.(OptionalUnit)`

For Example: 
```go
var ExampleVolume Volume = 15.(uL)
```
means "Create a parameter named ExampleVolume, which only accepts volume units, with a default value of 15 microlitres. [LINK to type system] by convention variables are named in UpperCamelCase (using an Upper-case letter for each word as a single name). All Parameters are visible to other Elements, so also by convention they start with an Upper-case letter.

`ReplicateCount` is a special variable, which tells Antha to run `ReplicateCount` additional copies of each sample. The association of the results, and impact on workflow is automatically handled by the system.

## Data ##
```go
// Data which is returned from this protocol, and data types
Data {
	var SampleAbsorbance Absorbance
	var ProteinConc Concentration
	var RSquared float32	
	var control_absorbance [control_curve_points+1]Absorbance
	var control_concentrations [control_curve_points+1]float64
}
```

The Data block defines the information outputs from the Bradford Element. Declaration follows the same format as the Parameters block, although no default values are given. By  convention, results which may be consumed as outputs by other Elements are named with an Upper-case first letter. Variables which start with a lower-case first letter are intended for use only within the protocol, and while the values will be logged, they are not available to any other Antha Elements. Additionally, they are shared across all executing copies of an Element, which requires their use to be carefully considered to avoid concurrency problems. 

## Inputs ##
```go
// Physical Inputs to this protocol with types
Inputs {
	var Sample WaterSolution
	var BradfordReagent WaterSolution
	var ControlProtein WaterSolution
	var DistilledWater WaterSolution
}
```

The Inputs block defines the physical inputs to the protocol, along with their appropriate type. For example, in this block, all the types are WaterSolutions, meaning they can be operated on by a standard liquid handling robot, or manual pipette operations. Additional attributes of the physical samples are used by the Antha Execution system to plan the optimal way to perform physical actions such as mixing on samples based on their types.

Declaration syntax follows the form of the information variables, with the exceptions that no default value is declared.

## Outputs ##
```go
// Physical outputs from this protocol with types
Outputs {
	// None
}
```

This protocol is a destructive protocol, meaning that all of the intermediates and the final sample created as a result of this assay needs to be destroyed after performing the protocol. However, many protocols also output a physical sample, such as a new liquid solution containing DNA, enzymes, or cells. By default, any physical sample which is not passed to an Output is scheduled for destruction, with methods appropriate to the safety level of the sample (such as having to autoclave genetic materials, etc)

## Requirements ##
```go
Requirements {
	// None
}
```

The Requirements block is executed by a protocol before it begins work, to allow confirming the state of any inputs. For example, a test like `require(!Sample.Expired())` would explicitly confirm that the input sample had not, for the information on the type of sample available to the Antha system, expired by being left outside of a temperature controlled environment for too long. By default, Antha confirms items such as whether samples have expired automatically, and this block is provided primarily as a convenience for certain classes of more complex tests needed to validate complex inputs such as DNA assembly protocols.

## Setup ##
```go
Setup {
	control.Config(config.per_plate)	

	var control_curve[ControlCurvePoints + 1]WaterSolution
			
	for i:= 0; i < control_curve_points; i++ {
		go func(i) {
			if (i == control_curve_points) {
					control_curve[i] = mix(distilled_water(sample_volume) + bradford_reagent(bradford_volume)) 
				} else {
					control_curve[i] = serial_dilute(control_protein(sample_volume), control_curve_points, control_curve_dilution_factor, i)
				}
				control_absorbance[i] = plate_reader.read(control_curve[i], wavelength)
			}
		}
	} 
}
```

The Setup block is performed once the first time that an Element is executed. This can be used to perform any configuration that is needed globally for the Element, and is also used to define any special setup that may be needed for groups of concurrent tasks that might be executed at the same time. Any variables that need to be accessed by the Steps function globally can be defined here as well, but need to be handled with care to avoid concurrency problems. 

In the context of this Bradford Element, the Control library is used to enable the protocol to define a block of samples that need to be performed in concert with any block of tasks.  For example, each 96 well plate of samples needs to have a set of control samples added to it to enable the calculation of the amount of protein in each sample. Creating these control samples is done via a serial dilution of a known protein sample, using up to `ControlCurvePoints + 1` samples in each block. 

## Steps ##
```go
Steps {
	var product = mix(Sample(SampleVolume) + BradfordReagent(BradfordVolume))
	SampleAbsorbance = PlateReader.ReadAbsorbance(product, Wavelength)
}
```

The heart of an Antha Element is the Steps block, which defines the actual steps taken to transform a set of input parameters and samples into the output data and samples. The Steps are a kernel function, meaning they share no information for every concurrent sample that is processed, and define the workflow to transform a single block of inputs and samples into a single set of outputs, even if the Element is operating on an entire array (such as micro-titre plate of samples at once). 

In this Bradford Element, a new sample is created, which is the result of mixing SampleVolume amount of the physical input, Sample. Note: no physical locations, layouts, or methods are required, as the Antha Execution layer manages determining the capabilities to perform library functions such as the mix function depending on the equipment registered with the system. Where automated methods of sample transport or liquid handling are not available, it falls back to providing manual instructions.

The newly created sample, product, is then passed to another Antha Element, which in this case represents a device driver for a plate reader, to perform a measurement on the sample. Where such processing needs to be batched (such as performing it a plate at a time) the system automatically manages the scheduling of samples to be collocated on a shared micro-titre plate.

Lastly, the results of the plate reader are stored as the output data variable SampleAbsorbance.

## Analysis ##
```go
Analysis {
	// need the control samples to be completed before doing the analysis
	control.WaitForCompletion()
	// Need to compute the linear curve y = m * x + c 
	var r regression.Regression
	r.SetObservedName("Absorbance")
	r.SetVarName(0, "Concentration")
	r.AddDataPoint(regression.DataPoint{Observed : ControlCurvePoints+1, Variables : ControlAbsorbance})
	r.AddDataPoint(regression.DataPoint{Observed : ControlCurvePoints+1, Variables : ControlConcentrations})
	r.RunLinearRegression()
	m := r.GetRegCoeff(0)
	c := r.GetRegCoeff(1)
	RSquared = r.Rsquared	
	
	ProteinConc = (sample_absorbance - c) / m
}
```

The Analysis block defines how the results of the Steps can should be transformed into final values, if appropriate. Computing the final protein concentration of a Bradford assay requires having the data back from the control samples, performing a linear regression, and then using those results to normalize the plate reader results.

To start, the `control.WaitForCompletion()` is a utility method saying that the Analysis needs to wait for the concurrent control samples to be fully processed before analysis can continue. The actual linear regression is then performed by using an existing Go library for linear regression, which like all Go code, can be seamlessly included in Antha.

Lastly, the final normalized result (the protein concenration in the sample) is stored in the ProteinConc variable where it can be accessed by downstream Antha Elements.  

## Validation ##
```go
Validation {
	if SampleAbsorbance > 1 {
		panic("Sample likely needs further dilution")
	}
	if (RSquared < 0.9) {
		warn("Low r_squared on standard curve")
	}
	if (RSquared < 0.7) {
		panic("Bad r_squared on standard curve")
	}
	// TODO: add test of replicate variance
}
```

In an ideal world, no errors would ever occur, and all scientific protocols would work all the time. However, in reality errors happen, either because the protocol is being executed on inputs for which it was never designed and characterized to handle, mistakes happened during the execution, or because important factors which could impact the execution have not been included in Element design. 

The Validation block allows the definition of specific tests to verify the correct execution of an Element, along with reporting capabilities (and the ability to declare the execution a failure). For example, the Bradford assay can only handle a specific linear range of concentrations, so if the amount of protein in the sample is above or below that range, the assay will fail. 

The solution in such a case is to rerun the assay, with a different dilution factor, however as the Bradford Element is a destructive assay, it may require the generation of more source material which may not be possible, preventing the Element alone from handling such an error.

Validation checks can be grouped as destructive or non destructive. All the tests performed in this example are non-destructive, as they simply analyze the data. However, in other types of Elements, a validation test may require the consumption of some of a sample, such as to run a mass spec trace, and as such only random dipstick testing may be required rather than validating every sample which is executed. Policies such as dipstick validation testing can be configured in the Antha Execution environment.
