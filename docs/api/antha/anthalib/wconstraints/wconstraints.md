---
layout: default
type: api
navgroup: docs
shortname: anthalib/wconstraints
title: anthalib/wconstraints
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: anthalib/wconstraints
---
# wconstraints
--
    import "."


## Usage

#### type Constraint

```go
type Constraint interface {
	// constraints return true when violated
	Check(i interface{}) bool
}
```


#### type Constraints

```go
type Constraints interface {
	Add(c Constraint)
	Remove(c Constraint)
}
```


#### type TempConstraint

```go
type TempConstraint struct {
	Min wunit.Temperature
	Max wunit.Temperature
}
```

Temperature constraint

#### func (TempConstraint) Check

```go
func (tc TempConstraint) Check(i interface{}) bool
```

#### type TimeConstraint

```go
type TimeConstraint struct {
	Start  time.Time
	Length time.Duration
}
```

time constraint

#### func (*TimeConstraint) Check

```go
func (tc *TimeConstraint) Check(i interface{}) bool
```
