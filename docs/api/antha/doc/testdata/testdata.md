---
layout: default
type: api
navgroup: docs
shortname: doc/testdata
title: doc/testdata
apidocs:
  published: 2014-11-14
  antha_version: 0.0.1
  package: doc/testdata
---
# e
--
    import "."

The package e is a go/doc test for embedded methods.

## Usage

#### type T1

```go
type T1 struct {
}
```

T1 has no embedded (level 1) M method due to conflict.

#### type T2

```go
type T2 struct {
}
```

T2 has only M as top-level method.

#### func (T2) M

```go
func (T2) M()
```
T2.M should appear as method of T2.

#### type T3

```go
type T3 struct {
}
```

T3 has only M as top-level method.

#### func (T3) M

```go
func (T3) M()
```
T3.M should appear as method of T3.

#### type T4

```go
type T4 struct{}
```


#### func (*T4) M

```go
func (*T4) M()
```
T4.M should appear as method of T5 only if AllMethods is set.

#### type T5

```go
type T5 struct {
	T4
}
```


#### type U1

```go
type U1 struct {
	*U1
}
```


#### func (*U1) M

```go
func (*U1) M()
```
U1.M should appear as method of U1.

#### type U2

```go
type U2 struct {
	*U3
}
```


#### func (*U2) M

```go
func (*U2) M()
```
U2.M should appear as method of U2 and as method of U3 only if AllMethods is
set.

#### type U3

```go
type U3 struct {
	*U2
}
```


#### func (*U3) N

```go
func (*U3) N()
```
U3.N should appear as method of U3 and as method of U2 only if AllMethods is
set.

#### type U4

```go
type U4 struct {
}
```


#### func (*U4) M

```go
func (*U4) M()
```
U4.M should appear as method of U4.

#### type V1

```go
type V1 struct {
	*V2
	*V5
}
```


#### type V2

```go
type V2 struct {
	*V3
}
```


#### type V3

```go
type V3 struct {
	*V4
}
```


#### type V4

```go
type V4 struct {
	*V5
}
```


#### func (*V4) M

```go
func (*V4) M()
```
V4.M should appear as method of V2 and V3 if AllMethods is set.

#### type V5

```go
type V5 struct {
	*V6
}
```


#### type V6

```go
type V6 struct{}
```


#### func (*V6) M

```go
func (*V6) M()
```
V6.M should appear as method of V1 and V5 if AllMethods is set.
