[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# StatusProvider

![Screenshot](https://github.com/mariohahn/StatusProvider/blob/master/Github%20Screenshots/StatusProvider.png?raw=true)

Protocol to handle initial Loadings, Empty Views and Error Handling in a ViewController &amp; views

## CocoaPods Podfile

```ruby
pod 'StatusProvider'
```

## Functions

* Loading
* EmptyView
* Error Handling

## How to use?
```swift

class ErrorViewController: UIViewController, StatusController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Error"

        let status = Status(title: "Error", description: "Oh... fu**", actionTitle: "Retry 🚀") {

        }
        show(status: status)        
    }
}

class ActivityViewController: UIViewController, StatusController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Loading"

        let status = Status(isLoading: true, description: "Lädt…")

        show(status: status)
    }
}

class EmptyViewController: UIViewController, StatusController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Empty"

        let status = Status(title: "no Data", description: "No data available.💣", actionTitle: "Create ⭐️", image: UIImage(named: "placeholder_instagram")) {
            self.hideStatus()
        }    

        show(status: status)        
    }
}

```
