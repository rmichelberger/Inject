# Inject

[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/) 

A leightweigth dependency injection library for Swift and SwiftUI projects.


## Installing Inject
Inject supports [Swift Package Manager](https://www.swift.org/package-manager/).

### Swift Package Manager

To install Inject using [Swift Package Manager](https://github.com/apple/swift-package-manager) you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for the Inject repo with the current version:

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/rmichelberger/Inject

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/rmichelberger/Inject/", from: "1.0.0")
```

## Usage

Define the dependencies needed in the project:

```swift
func Dependencies() {    
    @Provides var apiService = { ApiService() }
    @Provides var retroSwift = {
        let logger = SimpleLogger()
        let client = OkHttpClient(logger: logger)
        return RetroSwift(client: client)
    }
    @Provides var useCase = { UseCase() }
        

    // ViewModels
    @Provides var artListViewModel = { ArtListViewModel() }
    @Provides var artDetailViewModel = { ArtDetailViewModel() }
    
    // Singletons
    @Singleton var repository: Repository = RepositoryImpl()
}
```


To inject dependencies, use `@Inject`, like this:

```swift
@Inject private var useCase: UseCase
```
```swift
@Inject private var apiService: ApiService
```
```swift
@Singleton private var repository: Repository
```
```swift
@StateObject private var viewModel: ArtListViewModel = ViewModel()
```


Inspired by [hilt](https://dagger.dev/hilt/).


