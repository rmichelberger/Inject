import SwiftUI

public func ViewModel<T: ObservableObject>() -> T {
    @Inject var viewModel: T
    return viewModel
}
