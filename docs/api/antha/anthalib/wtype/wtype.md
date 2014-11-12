---
layout: default
type: api
navgroup: docs
shortname: wtype
title: wtype
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: wtype
---
# wtype
--
    import "."


## Usage

```go
var MatterLib map[string]GenericMatter
```
map of matter types

#### func  GetMatterLib

```go
func GetMatterLib(fn string) (*(map[string]GenericMatter), error)
```

#### func  MakeMatterLib

```go
func MakeMatterLib() map[string]GenericMatter
```

#### func  NewLiquid

```go
func NewLiquid(liquidtype string, amount float64)
```

#### type BioSequence

```go
type BioSequence interface {
	Sequence() string
}
```


#### type Chiller

```go
type Chiller interface {
	Cool(p Physical, t wunit.Temperature)
	CoolingRate() wunit.Measurement
}
```


#### type CompositeDevice

```go
type CompositeDevice struct {
	Mf         string
	Tp         string
	Components []*Device
}
```


#### func (*CompositeDevice) Manufacturer

```go
func (cd *CompositeDevice) Manufacturer() string
```

#### func (*CompositeDevice) Ready

```go
func (cd *CompositeDevice) Ready() bool
```

#### func (*CompositeDevice) Type

```go
func (cd *CompositeDevice) Type() string
```

#### type Container

```go
type Container interface {
	Solid
	ContainerVolume() wunit.Volume // this can be deferred to its Shape()
	Contents() []Physical
	Add(p Physical)
	Remove(v wunit.Volume) Physical
	ContainerType() string
	PartOf() *Entity
}
```

defines something as being able to have contents

#### type DNA

```go
type DNA struct {
	GenericPhysical
	Seq DNASequence
}
```


#### type DNASequence

```go
type DNASequence struct {
	Seq string
}
```


#### func (*DNASequence) Sequence

```go
func (dna *DNASequence) Sequence() string
```

#### type DeSealer

```go
type DeSealer interface {
	Peel(s Sealed) Solid
}
```


#### type Device

```go
type Device interface {
	Solid
	Manufacturer() string
	Type() string
	Ready() bool
}
```


#### type Entity

```go
type Entity interface {
	// Entities must be solid objects
	Solid
	// dummy method since there is no obvious set of methods to define this
	IsEntity()
}
```

The Entity interface declares that this object is an independently movable thing

#### type Environment

```go
type Environment struct {
	Temp        wunit.Temperature
	Pres        wunit.Pressure
	Composition []Physical
}
```

datatype to define the surroundings

#### type Enzyme

```go
type Enzyme struct {
	Properties map[string]wunit.Measurement
}
```


#### type Gas

```go
type Gas interface {
	Physical
	Gas()
}
```

so far the best definition of this is not-solid-or-liquid...

#### type GenericDevice

```go
type GenericDevice struct {
	Mf    string
	Tp    string
	State bool
}
```


#### func (*GenericDevice) Manufacturer

```go
func (gd *GenericDevice) Manufacturer() string
```

#### func (*GenericDevice) Ready

```go
func (gd *GenericDevice) Ready() bool
```

#### func (*GenericDevice) Type

```go
func (gd *GenericDevice) Type() string
```

#### type GenericEntity

```go
type GenericEntity struct {
	GenericSolid
}
```

a simple structure to allow a generic entity class to be defined

#### func (*GenericEntity) IsEntity

```go
func (ge *GenericEntity) IsEntity()
```
dummy method

#### type GenericLiquid

```go
type GenericLiquid struct {
	GenericPhysical
}
```


#### func  NewGenericLiquid

```go
func NewGenericLiquid(name string, mattertype string, volume wunit.Volume) GenericLiquid
```

#### func (*GenericLiquid) Clone

```go
func (gl *GenericLiquid) Clone() GenericLiquid
```

#### func (*GenericLiquid) Sample

```go
func (gl *GenericLiquid) Sample(v wunit.Volume) Liquid
```

#### func (*GenericLiquid) Viscosity

```go
func (gl *GenericLiquid) Viscosity() float64
```

#### type GenericMatter

```go
type GenericMatter struct {
	Iname string
	Imp   wunit.Temperature
	Ibp   wunit.Temperature
	Ishc  wunit.SpecificHeatCapacity
}
```


#### func  MatterByName

```go
func MatterByName(name string) GenericMatter
```

#### func (*GenericMatter) BoilingPoint

```go
func (gm *GenericMatter) BoilingPoint() wunit.Temperature
```

#### func (*GenericMatter) Clone

```go
func (gm *GenericMatter) Clone() GenericMatter
```

#### func (*GenericMatter) MatterType

```go
func (gm *GenericMatter) MatterType() string
```

#### func (*GenericMatter) MeltingPoint

```go
func (gm *GenericMatter) MeltingPoint() wunit.Temperature
```

#### func (*GenericMatter) SpecificHeatCapacity

```go
func (gm *GenericMatter) SpecificHeatCapacity() wunit.SpecificHeatCapacity
```

#### type GenericPhysical

```go
type GenericPhysical struct {
	GenericMatter
}
```


#### func  NewGenericPhysical

```go
func NewGenericPhysical(mattertype string) GenericPhysical
```

#### func (*GenericPhysical) Clone

```go
func (gp *GenericPhysical) Clone() GenericPhysical
```

#### func (*GenericPhysical) Density

```go
func (gp *GenericPhysical) Density() wunit.Density
```

#### func (*GenericPhysical) Mass

```go
func (gp *GenericPhysical) Mass() wunit.Mass
```

#### func (*GenericPhysical) Name

```go
func (gp *GenericPhysical) Name() string
```

#### func (*GenericPhysical) SetMass

```go
func (gp *GenericPhysical) SetMass(m wunit.Mass) wunit.Mass
```

#### func (*GenericPhysical) SetName

```go
func (gp *GenericPhysical) SetName(s string) string
```

#### func (*GenericPhysical) SetTemperature

```go
func (gp *GenericPhysical) SetTemperature(t wunit.Temperature)
```

#### func (*GenericPhysical) SetVolume

```go
func (gp *GenericPhysical) SetVolume(v wunit.Volume) wunit.Volume
```

#### func (*GenericPhysical) Temperature

```go
func (gp *GenericPhysical) Temperature() wunit.Temperature
```

#### func (*GenericPhysical) Volume

```go
func (gp *GenericPhysical) Volume() wunit.Volume
```

#### type GenericSBSFormatPlate

```go
type GenericSBSFormatPlate struct {
	GenericEntity
	Manufr  string
	LType   string
	WellArr [][]Well
}
```


#### func (*GenericSBSFormatPlate) Add

```go
func (gl *GenericSBSFormatPlate) Add(p Physical)
```
find the first empty well and add this to it

#### func (*GenericSBSFormatPlate) FirstEmptyWell

```go
func (gl *GenericSBSFormatPlate) FirstEmptyWell() Well
```

#### func (*GenericSBSFormatPlate) LabwareType

```go
func (gl *GenericSBSFormatPlate) LabwareType() string
```

#### func (*GenericSBSFormatPlate) Manufacturer

```go
func (gl *GenericSBSFormatPlate) Manufacturer() string
```

#### func (*GenericSBSFormatPlate) Material

```go
func (gl *GenericSBSFormatPlate) Material() Matter
```

#### func (*GenericSBSFormatPlate) WellAt

```go
func (gl *GenericSBSFormatPlate) WellAt(crds WellCoords) Well
```

#### func (*GenericSBSFormatPlate) Wells

```go
func (gl *GenericSBSFormatPlate) Wells() [][]Well
```

#### type GenericSolid

```go
type GenericSolid struct {
	GenericPhysical
}
```


#### func (*GenericSolid) Shape

```go
func (gs *GenericSolid) Shape() Shape
```

#### type GenericWell

```go
type GenericWell struct {
	GenericSolid
	ArrCnts []Physical
	Crds    WellCoords
	Vol     wunit.Volume
	Plate   *GenericSBSFormatPlate
}
```


#### func (*GenericWell) Add

```go
func (gw *GenericWell) Add(p Physical)
```

#### func (*GenericWell) ContainerType

```go
func (gw *GenericWell) ContainerType() string
```

#### func (*GenericWell) ContainerVolume

```go
func (gw *GenericWell) ContainerVolume() wunit.Volume
```

#### func (*GenericWell) Contents

```go
func (gw *GenericWell) Contents() []Physical
```

#### func (*GenericWell) PartOf

```go
func (gw *GenericWell) PartOf() Entity
```

#### type Geometry

```go
type Geometry interface {
	Height() wunit.Length
	Width() wunit.Length
	Depth() wunit.Length
}
```


#### type Heater

```go
type Heater interface {
	Heat(p Physical, t wunit.Temperature)
	HeatingRate() wunit.Measurement
}
```


#### type Labware

```go
type Labware interface {
	Entity
	Manufacturer() string
	LabwareType() string
}
```


#### type Layout

```go
type Layout interface {
}
```


#### type Liquid

```go
type Liquid interface {
	Physical
	Viscosity() float64
	// take some of this liquid
	Sample(v wunit.Volume) Liquid
}
```

liquid state

#### type Matter

```go
type Matter interface {
	MatterType() string
	MeltingPoint() wunit.Temperature
	BoilingPoint() wunit.Temperature
	SpecificHeatCapacity() wunit.SpecificHeatCapacity
}
```

base type for defining materials

#### type Mover

```go
type Mover interface {
	Grab(e Entity)
	Drop() Entity
	MoveGripperTo(c coordinates)
	MaxWeight() wunit.Mass
	Gripper() VariableSlot
}
```


#### type NonWaterSolution

```go
type NonWaterSolution struct {
	GenericLiquid
	Sltes []Physical
}
```


#### func (*NonWaterSolution) Solutes

```go
func (nas *NonWaterSolution) Solutes() []Physical
```

#### func (*NonWaterSolution) Solvent

```go
func (nas *NonWaterSolution) Solvent() Liquid
```

#### type Organism

```go
type Organism struct {
	Species *biotree.TOL // position on the TOL
}
```


#### type Parameter

```go
type Parameter struct {
	// This is simply used by the parser, it's not part of the underlying language
	Name     string
	Type     string
	RangeMin string
	RangeMax string
	Unit     string
}
```


#### type Physical

```go
type Physical interface {
	// embedded class for dealing with type of material
	Matter
	// identifier of sample
	Name() string
	SetName(string) string
	// mass of sample
	Mass() wunit.Mass
	SetMass(wunit.Mass) wunit.Mass
	// volume occupied by sample
	Volume() wunit.Volume
	SetVolume(wunit.Volume) wunit.Volume
	// temperature of object
	Temperature() wunit.Temperature
	SetTemperature(t wunit.Temperature)
	// ratio of mass to volume
	Density() wunit.Density
}
```

a sample of matter

#### type Pipetter

```go
type Pipetter interface {
	Aspirate(l Liquid)
	Dispense(l Liquid)
	MovePipetteTo(c coordinates)
	MoveSpeedLimits() wunit.MeasurementLimits
	PipetteSpeedLimits() wunit.MeasurementLimits
	PipetteVolumeLimits() wunit.MeasurementLimits
}
```


#### type Plasmid

```go
type Plasmid struct {
}
```


#### type Plate

```go
type Plate interface {
	Labware
	Wells() [][]Well
	WellAt(crds WellCoords) Well
	WellsX() int
	WellsY() int
}
```


#### type Population

```go
type Population struct {
}
```


#### type Protein

```go
type Protein struct {
	GenericPhysical
	Seq ProteinSequence
}
```


#### type ProteinSequence

```go
type ProteinSequence struct {
	Seq string
}
```


#### func (*ProteinSequence) Sequence

```go
func (prot *ProteinSequence) Sequence() string
```

#### type RNA

```go
type RNA struct {
	GenericPhysical
	Seq RNASequence
}
```


#### type RNASequence

```go
type RNASequence struct {
	Seq string
}
```


#### func (*RNASequence) Sequence

```go
func (rna *RNASequence) Sequence() string
```

#### type Sealed

```go
type Sealed interface {
	IsSealed()
}
```


#### type Sealer

```go
type Sealer interface {
	Seal(s Solid) Sealed
}
```


#### type Shape

```go
type Shape interface {
	ShapeName() string
	IsShape()
	MinEnclosingBox() Geometry
}
```

defines a shape

#### type Slot

```go
type Slot interface {
	Container
	Dimensions() Geometry
}
```


#### type Solid

```go
type Solid interface {
	Physical
	Shape() Shape
}
```

solid state

#### type Solution

```go
type Solution interface {
	Liquid
	Concentration() wunit.Concentration
	ConcentrationOf(s string) wunit.Concentration
	Solvent() Liquid
	Solutes() []Physical
}
```


#### type Suspension

```go
type Suspension interface {
	Liquid
	Solvent() Liquid
	Solutes() []Physical
}
```


#### type VariableSlot

```go
type VariableSlot interface {
	Slot
	Capabilities() wunit.MeasurementLimits
}
```


#### type WaterSolution

```go
type WaterSolution struct {
	GenericLiquid
	Sltes []Physical
}
```


#### func (*WaterSolution) Concentration

```go
func (as *WaterSolution) Concentration() wunit.Concentration
```

#### func (*WaterSolution) ConcentrationOf

```go
func (as *WaterSolution) ConcentrationOf(s string) wunit.Concentration
```

#### func (*WaterSolution) Solutes

```go
func (as *WaterSolution) Solutes() []Physical
```

#### func (*WaterSolution) Solvent

```go
func (as *WaterSolution) Solvent() Liquid
```

#### type Well

```go
type Well interface {
	Container
	WellTypeName() string
	ResidualVolume() wunit.Volume
	Coords() WellCoords
}
```


#### type WellCoords

```go
type WellCoords struct {
	X int
	Y int
}
```

convenience structure for handling well coordinates

#### func  MakeWellCoordsA1

```go
func MakeWellCoordsA1(a1 string) WellCoords
```
make well coordinates in the "1A" convention

#### func  MakeWellCoordsXY

```go
func MakeWellCoordsXY(x, y string) WellCoords
```
make well coordinates in a manner compatble with "X1,Y1" etc.

#### func (*WellCoords) FormatAH

```go
func (wc *WellCoords) FormatAH() string
```

#### func (*WellCoords) FormatXY

```go
func (wc *WellCoords) FormatXY() string
```
return well coordinates in "X1Y1" format
