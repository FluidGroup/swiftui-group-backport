
```swift
#Preview {
  VariadicForEach(subviews: Group {
    Text("A")
    Text("A")
    Text("A")
  }, content: { v in
    HStack {
      Text(">")
      v
    }
  })
}
```
