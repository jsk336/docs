---
layout: default
type: api
navgroup: docs
shortname: anthalib/wtype
title: anthalib/wtype
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: anthalib/wtype
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
deserializes matter library from a JSON map structure

#### func  MakeMatterLib

```go
func MakeMatterLib() map[string]GenericMatter
```
make the initial matter library. This will eventually be deprecated.

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

defines things which have biosequences... useful for operations valid on
biosequences such as BLASTing / other alignment methods

#### type Chiller

```go
type Chiller interface {
	Cool(p Physical, t wunit.Temperature)
	CoolingRate() wunit.Measurement
}
```

device capable of decreasing the temperature

#### type CompositeDevice

```go
type CompositeDevice struct {
	Mf         string
	Tp         string
	Components []*Device
}
```

structure to define interface to a physical device which can perform more than
one operation

#### func (*CompositeDevice) Manufacturer

```go
func (cd *CompositeDevice) Manufacturer() string
```

#### func (*CompositeDevice) Ready

```go
func (cd *CompositeDevice) Ready() bool
```
the default for the whole device is to AND the Ready()s for the whole set of
devices

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
	Empty() bool
}
```

defines something as being able to have contents must be a solid object but does
not have to be an entity

#### type DNA

```go
type DNA struct {
	GenericPhysical
	Seq DNASequence
}
```

defines something as physical DNA hence it is physical and has a DNASequence

#### type DNASequence

```go
type DNASequence struct {
	Seq string
}
```

DNAsequence is a type of Biosequence

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

device capable of desealing labware

#### type Device

```go
type Device interface {
	Solid
	Manufacturer() string
	Type() string
	Ready() bool
}
```

device interface type

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

datatype to define the surroundings it keeps track of the temperature, pressure
and any physical components such as the gaseous composition

#### type Enzyme

```go
type Enzyme struct {
	Properties map[string]wunit.Measurement
}
```

structure which defines an enzyme -- solutions containing enzymes need careful
handling as they can be quite delicate

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

Generic device structure defining the manufacturer device type and current state
(true/false indicating "ready/not ready")

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
dummy method required so that GenericEntity implements Entity

#### type GenericLiquid

```go
type GenericLiquid struct {
	GenericPhysical
}
```

Structure which defines a generic liquid

#### func  NewGenericLiquid

```go
func NewGenericLiquid(name string, mattertype string, volume wunit.Volume) GenericLiquid
```
factory method for creating a new generic liquid

#### func (*GenericLiquid) Clone

```go
func (gl *GenericLiquid) Clone() GenericLiquid
```

#### func (*GenericLiquid) Sample

```go
func (gl *GenericLiquid) Sample(v wunit.Volume) Liquid
```
sample method for a generic liquid

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

structure defining data items required for defining matter

#### func  MatterByName

```go
func MatterByName(name string) GenericMatter
```
Functions for dealing with matter

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

GenericPhysical structure: holds data items required to define a physical object

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

A generic to define an SBS format plate

#### func (*GenericSBSFormatPlate) Add

```go
func (gl *GenericSBSFormatPlate) Add(p Physical)
```
find the first empty well and add this to it

#### func (*GenericSBSFormatPlate) FirstEmptyWell

```go
func (gl *GenericSBSFormatPlate) FirstEmptyWell() Well
```
find the first empty well in the plate

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

defines a generic solid structure

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

structure defining data items required for a well

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

#### func (*GenericWell) Empty

```go
func (gw *GenericWell) Empty() bool
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

interface to 3D geometry

#### type Heater

```go
type Heater interface {
	Heat(p Physical, t wunit.Temperature)
	HeatingRate() wunit.Measurement
}
```

device capable of increasing the temperature

#### type Labware

```go
type Labware interface {
	Entity
	Manufacturer() string
	LabwareType() string
}
```

general interface applicable to all labware

#### type Layout

```go
type Layout interface {
}
```

will hold spacial layouts on plates and provide traversals

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
	MoveTo(c coordinates)
	MaxWeight() wunit.Mass
	Gripper() VariableSlot
}
```

something which can move Entities about should be defined as generally as
possible

#### type NonWaterSolution

```go
type NonWaterSolution struct {
	GenericLiquid
	Sltes []Physical
}
```

a structure defining a non water solution

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

structure which defines an organism. These need specific handling -- some detail
is derived using the TOL structure

#### type Parameter

```go
type Parameter struct {
	Name     string
	Type     string
	RangeMin string
	RangeMax string
	Unit     string
}
```

structure defining a parameter as expressed in a protocol This is simply used by
the parser, it's not part of the underlying language

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

Pipetter unit

#### type Plasmid

```go
type Plasmid struct {
}
```

defines a plasmid

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

defines microplates. Microplates have wells.

#### type Population

```go
type Population struct {
}
```

a set of organisms, can be mixed or homogeneous

#### type Protein

```go
type Protein struct {
	GenericPhysical
	Seq ProteinSequence
}
```

physical protein sample has a ProteinSequence

#### type ProteinSequence

```go
type ProteinSequence struct {
	Seq string
}
```

ProteinSequence object is a type of Biosequence

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

RNA sample: physical RNA, has an RNASequence object

#### type RNASequence

```go
type RNASequence struct {
	Seq string
}
```

RNASequence object is a type of Biosequence

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

to be composed with an X to make a SealedX

#### type Sealer

```go
type Sealer interface {
	Seal(s Solid) Sealed
}
```

device capable of sealing labware

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

a holder on a device which can contain labware

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

interface defining a solution type. Defined as being a liquid, having a
concentration, a solvent and one or more solutes

#### type Suspension

```go
type Suspension interface {
	Liquid
	Solvent() Liquid
	Solutes() []Physical
}
```

interface to define a suspension type this also has a solvent and solutes but no
concentration

#### type VariableSlot

```go
type VariableSlot interface {
	Slot
	Capabilities() wunit.MeasurementLimits
}
```

a slot which can change size

#### type WaterSolution

```go
type WaterSolution struct {
	GenericLiquid
	Sltes []Physical
}
```

a solution with water as the solvent

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

defines a well in a microplate

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
