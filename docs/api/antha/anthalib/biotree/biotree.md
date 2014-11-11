# biotree
--
    import "."


## Usage

#### type TOL

```go
type TOL struct {
	UID      string
	Name     string
	Taxid    string
	Parent   *TOL
	Depth    int
	Children []*TOL
}
```


#### func  Load_TOL

```go
func Load_TOL(filename string) (*TOL, *map[string]*TOL)
```

#### func (TOL) Find_string

```go
func (t TOL) Find_string(name string) *TOL
```

#### func (TOL) Get_taxonomy

```go
func (t TOL) Get_taxonomy(arr []string) []string
```

#### func (TOL) IsAncestorOf

```go
func (t TOL) IsAncestorOf(t2 *TOL) string
```
