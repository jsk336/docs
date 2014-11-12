---
layout: default
type: api
navgroup: docs
shortname: anthalib/wunit
title: anthalib/wunit
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: anthalib/wunit
---
# wunit
--
    import "."


## Usage

#### func  GetPrefixLib

```go
func GetPrefixLib(fn string) (*(map[string]SIPrefix), error)
```

#### func  GetUnitLib

```go
func GetUnitLib(fn string) (*(map[string]GenericUnit), error)
```

#### func  MakePrefices

```go
func MakePrefices() map[string]SIPrefix
```

#### func  Make_units

```go
func Make_units() map[string]GenericUnit
```

#### func  NewWFloat

```go
func NewWFloat(v float64) wfloat
```

#### func  NewWInt

```go
func NewWInt(v int) wint
```

#### func  NewWString

```go
func NewWString(v string) wstring
```

#### func  PrefixDiv

```go
func PrefixDiv(x string, y string) string
```

#### func  PrefixMul

```go
func PrefixMul(x string, y string) string
```

#### func  ReverseLookupPrefix

```go
func ReverseLookupPrefix(i int) string
```

#### type Amount

```go
type Amount struct {
	ConcreteMeasurement
}
```

mole

#### func  NewAmount

```go
func NewAmount(v float64, unit string) Amount
```

#### func (*Amount) Quantity

```go
func (a *Amount) Quantity() Measurement
```

#### type Angle

```go
type Angle struct {
	ConcreteMeasurement
}
```

angle

#### func  NewAngle

```go
func NewAngle(v float64, unit string) Angle
```

#### type Area

```go
type Area struct {
	ConcreteMeasurement
}
```

area

#### func  NewArea

```go
func NewArea(v float64, unit string) Area
```

#### type BaseUnit

```go
type BaseUnit interface {
	// unit name
	Name() string
	// unit symbol
	Symbol() string
	// multiply by this to get SI value
	// nb this should be a function since we actually need
	// an affine transformation
	BaseSIConversionFactor() float64 // this can be calculated in many cases
	// if we convert to the SI units what is the appropriate unit symbol
	BaseSIUnit() string // if we use the above, what unit do we get?
}
```


#### type Concentration

```go
type Concentration struct {
	ConcreteMeasurement
}
```


#### func  NewConcentration

```go
func NewConcentration(v float64, unit string) Concentration
```

#### type ConcreteMeasurement

```go
type ConcreteMeasurement struct {
	// the raw value
	Mvalue wfloat
	// the relevant units
	Munit PrefixedUnit
}
```


#### func  NewMeasurement

```go
func NewMeasurement(v float64, unit string, prefix string) ConcreteMeasurement
```

#### func (*ConcreteMeasurement) RawValue

```go
func (cm *ConcreteMeasurement) RawValue() float64
```

#### func (*ConcreteMeasurement) SIValue

```go
func (cm *ConcreteMeasurement) SIValue() float64
```

#### func (*ConcreteMeasurement) SetValue

```go
func (cm *ConcreteMeasurement) SetValue(v float64) float64
```

#### func (*ConcreteMeasurement) Unit

```go
func (cm *ConcreteMeasurement) Unit() PrefixedUnit
```

#### type Density

```go
type Density struct {
	ConcreteMeasurement
}
```


#### func  NewDensity

```go
func NewDensity(v float64, unit string) Density
```

#### type Energy

```go
type Energy struct {
	ConcreteMeasurement
}
```

I suspect we may need to deal with the dimensional question at some stage this
is really Mass(Length/Time)^2

#### func  NewEnergy

```go
func NewEnergy(v float64, unit string) Energy
```

#### type Force

```go
type Force struct {
	ConcreteMeasurement
}
```


#### func  NewForce

```go
func NewForce(v float64, unit string) Force
```
a new force in Newtons

#### type GenericPrefixedUnit

```go
type GenericPrefixedUnit struct {
	GenericUnit
	SPrefix SIPrefix
}
```


#### func (*GenericPrefixedUnit) BaseSIConversionFactor

```go
func (gpu *GenericPrefixedUnit) BaseSIConversionFactor() float64
```

#### func (*GenericPrefixedUnit) BaseSISymbol

```go
func (gpu *GenericPrefixedUnit) BaseSISymbol() string
```

#### func (*GenericPrefixedUnit) Prefix

```go
func (gpu *GenericPrefixedUnit) Prefix() SIPrefix
```

#### func (*GenericPrefixedUnit) PrefixedSymbol

```go
func (gpu *GenericPrefixedUnit) PrefixedSymbol() string
```

#### func (*GenericPrefixedUnit) RawSymbol

```go
func (gpu *GenericPrefixedUnit) RawSymbol() string
```

#### func (*GenericPrefixedUnit) Symbol

```go
func (gpu *GenericPrefixedUnit) Symbol() string
```

#### type GenericUnit

```go
type GenericUnit struct {
	StrName             string
	StrSymbol           string
	FltConversionfactor float64
	StrBaseUnit         string
}
```


#### func  UnitBySymbol

```go
func UnitBySymbol(sym string) GenericUnit
```

#### func (*GenericUnit) BaseSIConversionFactor

```go
func (gu *GenericUnit) BaseSIConversionFactor() float64
```

#### func (*GenericUnit) BaseSIUnit

```go
func (gu *GenericUnit) BaseSIUnit() string
```

#### func (*GenericUnit) Name

```go
func (gu *GenericUnit) Name() string
```

#### func (*GenericUnit) Symbol

```go
func (gu *GenericUnit) Symbol() string
```

#### type Length

```go
type Length struct {
	ConcreteMeasurement
}
```

length

#### func  NewLength

```go
func NewLength(v float64, unit string) Length
```

#### type Mass

```go
type Mass struct {
	ConcreteMeasurement
}
```

mass

#### func  NewMass

```go
func NewMass(v float64, unit string) Mass
```

#### func (*Mass) Quantity

```go
func (m *Mass) Quantity() Measurement
```

#### type Measurement

```go
type Measurement interface {
	// the value in base SI units
	SIValue() float64
	// the value in the current units
	RawValue() float64
	// unit plus prefix
	Unit() PrefixedUnit
	// set the value, this must be thread-safe
	// returns old value
	SetValue(v float64) float64
}
```


#### type MeasurementLimits

```go
type MeasurementLimits struct {
	Limits map[string]NDManifold
}
```

for holding minima, maxima etc. e.g. ml.Limits["max"] =>
{"length"->{4.0,{"Metres", "m", 1.0}}}...

#### type NDManifold

```go
type NDManifold struct {
	Dimensions map[string]Measurement
}
```


#### type PrefixedUnit

```go
type PrefixedUnit interface {
	BaseUnit
	// the prefix of the unit
	Prefix() SIPrefix
	// the symbol including prefix
	PrefixedSymbol() string
	// the symbol excluding prefix
	RawSymbol() string
	// appropriate unit if we ask for SI values
	BaseSISymbol() string
}
```


#### func  NewPrefixedUnit

```go
func NewPrefixedUnit(prefix string, unit string) PrefixedUnit
```

#### type Pressure

```go
type Pressure struct {
	ConcreteMeasurement
}
```


#### func  NewPressure

```go
func NewPressure(v float64, unit string) Pressure
```
make a new pressure in Pascals

#### type SIPrefix

```go
type SIPrefix struct {
	// prefix name
	Name string
	// meaning in base 10
	Value float64
}
```


#### func  SIPrefixBySymbol

```go
func SIPrefixBySymbol(symbol string) SIPrefix
```

#### type SpecificHeatCapacity

```go
type SpecificHeatCapacity struct {
	ConcreteMeasurement
}
```


#### func  NewSpecificHeatCapacity

```go
func NewSpecificHeatCapacity(v float64, unit string) SpecificHeatCapacity
```

#### type SubstanceQuantity

```go
type SubstanceQuantity interface {
	Quantity() Measurement
}
```

mass or mole

#### type Temperature

```go
type Temperature struct {
	ConcreteMeasurement
}
```

temperature

#### func  NewTemperature

```go
func NewTemperature(v float64, unit string) Temperature
```

#### type Time

```go
type Time struct {
	ConcreteMeasurement
}
```

time

#### func  NewTime

```go
func NewTime(v float64, unit string) Time
```

#### type Volume

```go
type Volume struct {
	ConcreteMeasurement
}
```

volume -- strictly speaking of course this is length^3

#### func  NewVolume

```go
func NewVolume(v float64, unit string) Volume
```
