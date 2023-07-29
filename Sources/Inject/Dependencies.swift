public struct Dependencies {
    private static let dependencies = Dependencies()
    
    static subscript<T>(_ keyPath: KeyPath<Dependencies, T>) -> T {
        get { dependencies[keyPath: keyPath] }
    }
}
