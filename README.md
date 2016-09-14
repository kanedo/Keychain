# Keychain
Swift Class for Easy Keychain Access
## usage

```swift
  let setKey = Keychain.set("foo", value: "test")
  let getKey = Keychain.get("foo") as! String
```

## Changelog

### Version 1.1 (2016-09-14)

* created xcode-project containing a library
* added tests
* converted code to Swift 3

## Version 1.0 (2016-08-30)

* imported code from [Clayton McIlrath](https://gist.github.com/thinkclay/6552cffb7780176de62e)
* fixed bugs related to `Unmanaged` see [StackOverflow](http://stackoverflow.com/questions/24053618/swift-convert-nsmutabledata-to-nsstring)
