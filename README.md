<p>
  <img src="https://img.shields.io/badge/Swift-5.9-f05318.svg" />
  <img src="https://img.shields.io/badge/iOS->= 13.0-blue.svg" />
  <img src="https://img.shields.io/badge/macOS->= 11.0-blue.svg" />
  <img src="https://img.shields.io/badge/watchOS->= 6.0-blue.svg" />
  <img src="https://img.shields.io/badge/tvOS->= 13.0-blue.svg" />
</p>

# ReuseIdentifiable Macro
`@ReuseIdentifiable` Swift macro that generates a `reuseIdentifier` field useful for reuse of your `UITableViewCells`, `UICollectionViewCells` and in other scenarios.

## Installation

### Xcode

1. Click File > Add Package Dependencies
2. Paste the following link into the search field on the upper-right:
   ```
   https://github.com/gleb032/ReuseIdentifiable.git
   ```

### Swift Package Manager

In `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/gleb032/ReuseIdentifiable.git", from: "1.0.0")
]
```

## Usage
Create a class with `@ReuseIdentifiable` maros:
```swift
import ReuseIdentifiable

@ReuseIdentifiable
class TableViewCell: UITableViewCell {
    ...
}
```
Now you can use field `reuseIdentifier`:
```swift
tableView.register(
    TableViewCell.self,
    forCellWithReuseIdentifier: TableViewCell.reuseIdentifier
)

let cell = tableView.dequeueReusableCell(
    withReuseIdentifier: TableViewCell.reuseIdentifier,
    for: indexPath
)
```

## License

The project is released under the [MIT License](https://github.com/gleb032/ReuseIdentifiable/blob/master/LICENSE)
