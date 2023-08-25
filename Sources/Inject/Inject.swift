@propertyWrapper
public struct Inject<T> {
    public private(set) var wrappedValue: T
    
    public init(_ keyPath: KeyPath<Dependencies, T>) {
        wrappedValue = Dependencies[keyPath]
    }
}
    
public struct Dependencies {
    private static let dependencies = Dependencies()
    
    fileprivate static subscript<T>(_ keyPath: KeyPath<Dependencies, T>) -> T {
        get { dependencies[keyPath: keyPath] }
    }
}

//@propertyWrapper
//public struct Provides<T> {
//    public private(set) var wrappedValue: () -> T
//
//    public init(wrappedValue: @escaping () -> T) {
//        let key = String(describing: T.self)
//        Provider.container[key] = wrappedValue
//        self.wrappedValue = wrappedValue
//        print(key)
//    }
//}
//
//fileprivate struct Provider {
//    static var container = [String: Any]()
//}
