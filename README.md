# Inject

[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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

### 1. Dependencies 

You need to define the providers for each dependency in the project.

Signature of `@Provides`:

```swift
@Provides var dependency: () -> Dependency = { Dependency() }
```

Example:
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


Initialize dependencies on app start:
```swift
@main
struct MyApp: App {
    
    init() {
        Dependencies()
    }
```

### 2. Inject

To inject dependencies, use `@Inject`:

```swift
@Inject private var dependency: Dependency
```
Example:
```swift

final class RepositoryImpl: Repository {
    @Inject private var apiService: ApiService

    func getArtList() async throws -> [ArtData] {
        try await apiService.getArtList().data
    }
    
    func getArtDetail(id: Int) async throws -> ArtDetailData {
        try await apiService.getArtDetail(id: id).data
    }
}
```

#### Singleton
For singelton dependency use `@Singleton`:
```swift
@Singleton private var repository: Repository
```
#### View models

View models can be injected by `ViewModel()`:
```swift
@StateObject private var viewModel: ArtListViewModel = ViewModel()
```
#### Overview

 Define | Inject | Scope
 --- | --- | ---
 `@Provide` | `@Inject` | Lifecycle is defined in the provider function
 `@Singleton` | `@Singleton` | App lifecycle

Inspired by [hilt](https://dagger.dev/hilt/).


