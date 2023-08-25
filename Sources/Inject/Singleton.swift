@propertyWrapper
public struct Singleton<T> {
    public private(set) var wrappedValue: T
    
    public init(wrappedValue: T) {
        SingletonContainer.container[String(describing: T.self)] = wrappedValue
        self.wrappedValue = wrappedValue
    }
    
    public init() {
        guard let value = SingletonContainer.container[String(describing: T.self)] as? T else {
            preconditionFailure("@Singleton var singleton = \(String(describing: T.self))() is missing")
        }
        wrappedValue = value
    }
}

fileprivate struct SingletonContainer {
    fileprivate static var container = [String: Any]()
}
