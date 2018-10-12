# Acrosure Swift SDK

Swift SDK for connecting with Acrosure Insurance Gateway

## Installation

### CocoaPods (iOS 8+)

You can use CocoaPods to install AcrosureSDK by adding it to your Podfile:

```
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'AcrosureSDK', '~> 1.0'
end
```

### Carthage (iOS 8+)

You can use Carthage to install AcrosureSDK by adding it to your Cartfile:

```
github "AcrosureSDK/acrosure-swift-sdk" ~> 1.0
```

If you use Carthage to build your dependencies, make sure you have added AcrosureSDK.framework to the "Linked Frameworks and Libraries" section of your target, and have included them in your Carthage framework copying build phase.

### Swift Package Manager

You can use The Swift Package Manager to install AcrosureSDK by adding the proper description to your Package.swift file:

```
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/AcrosureSDK/acrosure-swift-sdk.git", from: "1.0.0"),
    ]
)
```

Then run swift build whenever you are prepared.

## Getting Started

Import AcrosureClient into your project.

```swift
import AcrosureSDK
```

Instantiate with an API key from [Acrosure Dashboard](https://dashboard.acrosure.com).

```swift
let client = AcrosureClient(token: '<YOUR_PUBLIC_TOKEN>')
```

## Basic Usage

AcrosureClient provides several objects such as `application`, `product`, etc. and associated APIs.

Any response will be inside an response object with type `AcrosureResponse` which has following structure:

```swift
struct AcrosureResponse {
  var status: String?
  var data: JSON?
  var message: String?
  var pagination: JSON?
}
```

In which `data` field is where the result will be in.

Functions use [Closures in Swift](https://docs.swift.org/swift-book/LanguageGuide/Closures.html) for response handling.

### Dependencies

This SDK uses [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) for JSON handling and [Alamofire](https://github.com/Alamofire/Alamofire) for HTTP Request.

### Application

#### Get

Get application with specified id.

```swift
client.application.get(id: "appl_SAMPLE01") { response in
  // ...
}
```

#### Create

Create an application.

```swift
client.application.create(productId: 'prod_ta') { response in
  // ...
}
```

#### Update

Update an application.

```swift
client.application.update(
  id: "appl_SAMPLE01",
  basicData: {},
  packageOptions: {},
  additionalData: {},
  packageCode: '<package_code>',

) { response in
  // ...
}
```

#### Get packages

Get current application available packages.

```swift
client.application.getPackages(id: "appl_SAMPLE01") { response in
  // ...
}
```

#### Select package

Select package for current application.

```swift
client.application.selectPackage(id: "appl_SAMPLE01", packageCode: '<package_code>) { response in
  // ...
}
```

#### Get package

Get selected package of current application.

```swift
client.application.getPackage(id: "appl_SAMPLE01") { response in
  // ...
}
```

#### Get 2C2P Payment Hash

Get hash object for 2C2P payment usage.

```swift
client.application.getHash(id: "appl_SAMPLE01", frontendUrl: "https://example.com") { response in
  // ...
}
```

#### Submit

Submit current application.

```swift
client.application.submit(id: 'appl_SAMPLE01') { response in
  // ...
}
```

#### List

List your applications (with or without query).

```swift
client.application.list() { response in
  // ...
}
```

### Product

#### Get

Get product with specified id.

```swift
client.product.get(id: 'prod_ta') { response in
  // ...
}
```

#### List

List your products (with or without query).

```swift
client.product.list() { response in
  // ...
}
```

### Policy

#### Get

Get policy with specified id.

```swift
client.policy.get(id: 'plcy_SAMPLE01') { response in
  // ...
}
```

#### List

List your policies (with or without query).

```swift
client.policy.list() { response in
  // ...
}
```

### Data

#### Get

Get values for a handler (with or without dependencies, please refer to Acrosure API Document).

```swift
// Without dependencies
client.data.get(handler: "province") { response in
  // ...
}

// With dependencies
client.data.get(handler: "subdistrict", dependencies:["กรุงเทพมหานคร","วังทองหลาง"]) { response in
  // ...
}
```

### Team

#### Get info

Get current team information.

```swift
client.team.getInfo() { response in
  // ...
}
```

## Advanced Usage

Please refer to [Acrosure API Document](https://docs.acrosure.com/docs/api-overall.html) for more details on Acrosure API.

## Associated Acrosure API endpoints

### Application

```
/applications/get
/applications/list
/applications/create
/applications/update
/applications/get-packages
/applications/get-package
/applications/select-package
/applications/submit
/applications/get-hash
```

### Product

```
/products/get
/products/list
```

### Policy

```
/policies/get
/policies/list
```

### Data

```
/data/get
```

### Team

```
/teams/get-info
```

## Development

### Prerequisites

- [Xcode](https://developer.apple.com/xcode/)
- [CocoaPods](https://cocoapods.org/)

### Getting Started

`pod install`

### Testing

Use xcode!

#### via CLI:

Using [xcpretty](https://github.com/supermarin/xcpretty) is recommended.

```shell
xcodebuild test -workspace AcrosureSDK.xcworkspace -scheme AcrosureSDKTests -destination 'platform=iOS Simulator,name=iPhone 6s,OS=12.0' | xcpretty
```

Without xcpretty:

```shell
xcodebuild test -workspace AcrosureSDK.xcworkspace -scheme AcrosureSDKTests -destination 'platform=iOS Simulator,name=iPhone 6s,OS=12.0'
```
