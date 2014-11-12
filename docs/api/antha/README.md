antha
=======

Storage model work in progress

```go
// Example bradford protocol.
// Computes the standard curve from a linear regression
// TODO: implement replicates from parameters
protocol bradford
import (
	"plate_reader"
	"github.com/sajari/regression"
	"standard_labware"
)

// Input parameters for this protocol (data)
Parameters {
	var sample_volume Volume = uL(15)
	var bradford_volume Volume = uL(5)
	var wavelength Wavelength = nm(595)
	var control_curve_points uint32 = 7
	var control_curve_dilution_factor uint32 = 2
	var replicate_count uint32 = 1 // Note: 1 replicate means experiment is in duplicate, etc.
}

// Data which is returned from this protocol, and data types
Data {
	var sample_absorbance Absorbance
	var protein_conc Concentration
	var r_squared float32	
	var control_absorbance [control_curve_points+1]Absorbance
	var control_concentrations [control_curve_points+1]float64
}


// Physical Inputs to this protocol with types
Inputs {
	var sample WaterSolution
	var bradford_reagent WaterSolution
	var control_protein WaterSolution
	var distilled_water WaterSolution
}

// Physical outputs from this protocol with types
Outputs {
	// None
}

Requirements {
	// None
}

Controls {
	control.Config(config.per_plate)	

	var control_curve[control_curve_points + 1]WaterSolution
			
/*	for i:= 0; i < control_curve_points; i++ {
		go func(i) {
			if (i == control_curve_points) {
					control_curve[i] = mix(distilled_water(sample_volume) + bradford_reagent(bradford_volume)) 
				} else {
					control_curve[i] = serial_dilute(control_protein(sample_volume), control_curve_points, control_curve_dilution_factor, i)
				}
				control_absorbance[i] = plate_reader.read(control_curve[i], wavelength)
			}
		}
	} */
}

Steps {
	var product = mix(sample(sample_volume) + bradford_reagent(bradford_volume))
	sample_absorbance = plate_reader.read(product, wavelength)
}

Analysis {
	// Need to compute the linear curve y = m * x + c 
	var r regression.Regression
	r.SetObservedName("Absorbance")
	r.SetVarName(0, "Concentration")
	r.AddDataPoint(regression.DataPoint{Observed : control_curve_points+1, Variables : control_absorbance})
	r.AddDataPoint(regression.DataPOint{Observed : Control_curve_points+1, Variables : data.Control_concentrations})
	r.RunLinearRegression()
	m := r.GetRegCoeff(0)
	c := r.GetRegCoeff(1)
	r_squared = r.Rsquared	
	
	protein_conc = (sample_absorbance - c) / m
}

Validation {
	if sample_absorbance > 1 {
		panic("Sample likely needs further dilution")
	}
	if (r_squared < 0.9) {
		warn("Low r_squared on standard curve")
	}
	if (r_squared < 0.7) {
		panic("Bad r_squared on standard curve")
	}
	// TODO: add test of replicate variance
}
```
