import SwiftUI

public func ViewModel<T: ObservableObject>(_ keyPath: KeyPath<Dependencies, T>) -> T {
    @Inject(keyPath) var viewModel: T
    return viewModel
}
