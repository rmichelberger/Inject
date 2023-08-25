@propertyWrapper
public struct Inject<T> {
    public private(set) var wrappedValue: T
    
    public init() {
        let key = String(describing: T.self)
        guard let provider = Provider.container[key] as? () -> T else {
            preconditionFailure("@Provides for \(String(describing: T.self)) is missing")
        }
        wrappedValue = provider()
    }
}

@propertyWrapper
public struct Provides<T> {
    public private(set) var wrappedValue: () -> T

    public init(wrappedValue: @escaping () -> T) {
        let key = String(describing: T.self)
        Provider.container[key] = wrappedValue
        self.wrappedValue = wrappedValue
    }
}

fileprivate struct Provider {
    static var container = [String: Any]()
}
