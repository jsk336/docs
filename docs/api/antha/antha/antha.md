# antha
--
    import "."

Defines interfaces for antha elements

## Usage

#### type Capabilities

```go
type Capabilities interface {
	Capabilities() map[string]string
}
```

returns a map of functions supported by the element and their return types
