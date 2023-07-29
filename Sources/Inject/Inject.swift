@propertyWrapper
public struct Inject<T> {
    public private(set) var wrappedValue: T
    
    public init(_ keyPath: KeyPath<Dependencies, T>) {
        wrappedValue = Dependencies[keyPath]
    }
}

public extension Inject where T: ViewModel {
    static func viewModel() -> T { T() }
}
