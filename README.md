# Acrosure Swift SDK

Swift SDK for connecting with Acrosure Insurance Gateway

## Prerequisites

- [Xcode](https://developer.apple.com/xcode/)
- [CocoaPods](https://cocoapods.org/)

## Getting Started

`pod install`

## Development

### Testing

Using [xcpretty](https://github.com/supermarin/xcpretty) is recommended.

```shell
xcodebuild test-without-building -workspace AcrosureSDK.xcworkspace -scheme AcrosureSDKTests -destination 'platform=iOS Simulator,name=iPhone 6s,OS=12.0' | xcpretty
```

Without xcpretty:

```shell
xcodebuild test-without-building -workspace AcrosureSDK.xcworkspace -scheme AcrosureSDKTests -destination 'platform=iOS Simulator,name=iPhone 6s,OS=12.0'
```
