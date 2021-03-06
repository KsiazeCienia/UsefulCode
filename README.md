# UsefulCode
Classes and extensions that are commonly used in projects. Feel free to copy and make suggestions 😃

## Foundation Extensions

### Sequence: 
* Checks if every element match given predicate 
```swift 
func all(matching predicate: (Element) -> Bool) -> Bool
``` 

* `func filterMatching<T>(to array: [T], where predicate: (Element, T) -> Bool) -> [Element]` - Filters all elements that matches predicate to elements from array passed as an argument
## UI Components

**`AdjustableCollectionViewLayout`** - fits cells to `UICollectionView` size based on number of cells in row/column and given ratio

## UI Extensions

**UIView:**
* `static var identifier: String` - property, String class description
* `func addSubviews(_ subviews: [UIView])` - add array of views to the view
* `func addSubviewWithEdgesConstraints(_ subview: UIView, offset: CGFloat = 0)` - Method to add subview with edges constraints (possible offset)
* `func addSubviewWithSafeAreaEdgesConstraints(_ subview: UIView, offset: CGFloat = 0)` - Method to add subview with edges constraint to `safeAreaLayoutGuide` (possible offset)

**UIStackView:**
* `func addArrangedSubviews(_ subviews: [UIView])` - Add arranged array of subviews

**UICollectionView:**
* `func register(_ type: UICollectionViewCell.Type)` - easier cell register
* `func register(_ types: [UICollectionViewCell.Type])` - easier cells register
* `func unsafeDequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T` - unsafe cell dequeue with cast to given class
* `func registerHeader(_ type: UICollectionReusableView.Type)` - easier reusable view register
* `func unsafeDequeueReusableHeaderView<T: UICollectionReusableView>(_ viewType: T.Type, for indexPath: IndexPath) -> T` - unsafe reusable view dequeue with cast to given class

**UITableView:**
* `func register(_ type: UITableViewCell.Type)` - easier cell register
* `func register(_ types: [UITableViewCell.Type])` - easier cells register
* `func unsafeDequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T` - unsafe cell dequeue with casting to specific class

**UIViewController:**
* `func addChild(_ viewController: UIViewController, attachingWith constraints: [NSLayoutConstraint])` - add child viewController and attach it to view with given constraints

**UIColor:**
* Link with name convetion
