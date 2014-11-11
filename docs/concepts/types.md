# Variable Types

## Variables and Types in Conventional Languages

The concept of variables is central to programming: in the usual scenario a
program takes data, transforms it in some way and then returns the transformed
data. 

Programming languages use variables to abstract out the general sequence of 
operations required to enact the transformation so that the program can be
used on any data within the scope of its inputs. 

Many conventional programming languages use the concept of a variable
*type* to define what sort of data is allowed to be stored in a particular
variable. The following example is quite typical:

```
int i=0
```

This statement does three things: 

1. it declares the existence of a variable with the name i to the system
2. it states that the only information which i can store is a single integer value
3. it initializes the value of i to 0

The go language, from which Antha derives much of its syntax, expresses this a little more briefly:

```
i:=0
```

This statement does exactly the same job as the first one, however it omits a specific 
reference to the variable type since it can be inferred from the use of the integer value 0 
to set its value. 

The Antha language extends this idea to the notion of physical types. Before getting into the details
its worth going over the benefits of typing. 

##Why use type systems?

As mentioned above, many languages use type systems to define what data is allowed to be stored
where, however not all of them do. Some developers find the need to be very specific about what
sort of data can be stored makes the language quite inflexible to use in practice. 

This can definitely be true but types have a very important advantage: they allow you to catch 
certain kinds of errors without having to run the program. For instance if you attempt to perform
an operation which is only valid on a string of characters on an integer value you must either
explicitly convert the integer into a string somehow or the compiler will return an error. 

When programming with pure data this can sometimes be foregone since it is cheap to run the program,
also if the possible inputs are quite constrained it may be feasible to test all possible cases. 
However for larger programs with complex behaviours over a very wide class of inputs many programmers
find that the benefits of the above (which is known as *static analysis*) are substantial since 
such errors are common and can be quite hard to find. 

##Type Composition

Languages such as Antha, go, java and C++ are *strongly typed* which means that any operation is only 
defined on specific types of inputs. This is useful for static type checking, however it does
mean that when there are cases where several kinds of inputs would all be equally valid it is not 
possible to write one function and have it do the same job on lots of inputs. 

In go the mechanism to deal with this is to divide up the properties of a variable in the language into
sets which can be composed together. This is essentially like saying that bats, birds and bumblebees
can all fly despite doing it in quite different ways and having many other properties which differ. 
Regardless of all those other differences they are still all flying animals, so any operation which 
applies to a flying animal will apply to all of them. 

Antha uses this mechanism to allow operations to be defined on types of objects in general: for instance
we define the idea of a liquid which allows us to define liquid handling as valid for any kind of 
liquid, regardless of what other properties it has.

A second important mechanism is to define types as falling into *hierarchies*, arranging types into levels
with inheritance of properties: all solids, liquids and gases are physical things, hence they share all
the properties a physical thing has although of course they have other properties. 

##Typing in Antha

Antha extends the notion of typing to the biochemistry domain using composition and hierarchical typing.
The two most significant hierarchies are the unit system and one relating to physical objects - quantities
and things. 

###Quantities

Quantities have units built-in so that it is always necessary to define which units a particular measurement
is made in. The Antha system knows a handful of basic units:

Unit Symbol | Unit Name| Meaning
------------|--------------------
M | Mole | amount of substance
m | minute | 60s
l/L | litre | volume
g | gramme | mass
V | Volt | electrical potential (energy / coulomb)
J | Joule | energy
A | Ampere | electrical current
N | Newton | Force 
s | second | time
rads/radians | radians | angle
degrees | degrees | angle
Hz | Herz | frequency
rpm | revolutions per minute | rotational frequency
C | Celisus | temperature
M/l | Moles per litre | concentraiton
g/l | grammes per litre | concentration
J/kg | Joules per kilogram | specific heat capacity
------------|--------------------

To permit static type checking, units are mapped into dimensions. In the alpha
release this is not strictly in line with the usual meaning of dimension (e.g. 
concentration is defined as a dimension) but this allows us to state that
a particular parameter is defined as a volume or concentration. 

Units are composed with SI prefices to create PrefixedUnits. The system implements
the standard SI prefix definitions as follows

Prefix | name | meaning
-------|------|--------
y | yocto | 10e-24
z | zepto | 10e-24
a | atto | 10e-18
f | femto | 10e-15
p | pico | 10e-12
n | nano | 10e-9
u | micro | 10e-6
m | milli | 10e-3
c | centi | 10e-2
d | deci | 10e-1
  | | 1
da | deca | 10e1
h | hecto | 10e2
k | kilo | 10e3
M | mega | 10e6
G | giga | 10e9
T | tera | 10e12
P | peta | 10e15
E | exa | 10e18
Z | zetta | 10e12
Y | yotta | 10e24
------|------|---------

Antha generally defines quantities using a Measurement type, which combines a 
PrefixedUnit with a value, which is a floating-point (decimal) number. 
Dimensions such as length, volume, concentration are then special cases of the
Measurement type - this allows the go compiler to check the types are appropriate
when the protocol is compiled. 

###Physical Types

Physical types start by defining the basic material composition of an object or sample,
using the Matter type. This type defines the principal features of the object, such as 
phase transition temperatures and specific heat capacity. 

Specific objects are defined to be of type Physical, which includes information about
mass, volume and temperature of the sample. 

Finally the physical state of an object is defined with one of three types of state: 
solid, liquid and gas, which allow checking to be performed for operations which are 
only defined on matter in one of these three states (e.g. moving a solid object using
a gripper or a liquid with a pipette)

There are many additional types which define things such as biological entities (DNA,
RNA, proteins), for more information check out the [docs](documentation link).

###Initial set of matter types
Name | Notes
-----|------
polypropylene | for plates and tubes
polycarbonate | for plates and tubes
ptfe | for plates and tubes
glass | for other labware
steel | other devices
water | basis of all solutions made in water
glycerol | basis of all solutions with high viscosity
ethanol | basis of all volatile solutions
surfactant | basis of all solutions which foam
-----|------

Since it would be difficult to properly define all liquid types up front the intention is for
solutions to derive their matter type from the liquids defined in this table. Thus all solutions
which behave essentially as water should be defined as water, viscous solutions as glycerol etc. 

These are heuristics for the liquid handling which can be extended in the future. The actual composition
of a solution is then defined using simple textual labels. 

###Labware

Labware defines items of use when mixing and storing solutions, such as plates, tubes etc. 
Labware types are physical, solid objects, meaning they must be composed of some sort of matter
such as those defined in the table above

In the initial language only the Plate labware type is defined, this has a number of wells which have
physical dimensions such as volume specified. Plates are assumed to be SBS-formatted although their height
can vary. 

###Devices

Devices come in a few classes: Pipetter, Mover, Heater, Chiller, Sealer, DeSealer. These types can be composed
together for devices which have multiple characteristics. These define methods which perform functions on 
liquids and also define Slots which can contain labware. 

###Accessory Types

There are several accessory types which define the capabilities of particular items: Container is a useful example, 
simply defining when something can act as a container for something else. It must have a set of physical dimensions
which allow the system to determine whether the proposed item to be placed within can fit. 

Entity is a further useful type which defines when an object is able to be moved as a discrete unit. For instance a
well in a standard microplate is not an entity since it cannot be detached from the plate, while the plate itself is.

##Summary

This has been a very brief tour of the typing system. For more information please consult [the documentation](the documentation)



