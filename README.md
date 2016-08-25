# StatusProvider
Protocol to handle initial Loadings, Emty Views and Error Handling in a ViewController &amp; views

## Podfile

```ruby
pod 'MHVideoPhotoGallery'
```

## How to use? 
```swift
extension YourViewController: StatusProvider { }

class YourViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataAsynchron()
    }
    
    func loadDataAsynchron() {
        
        show(statusType: .Loading)
        
        dispatch_after(dispatch_time( DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))),dispatch_get_main_queue()){
            
            let error = NSError(domain: "my.domain", code: 405, userInfo: [NSLocalizedDescriptionKey : "Oh... fu**"])
            
            self.show(statusType: StatusProviderType.Error(error: error, retry: {
                self.loadDataAsynchron()
            }))
        }
    }
}
```
