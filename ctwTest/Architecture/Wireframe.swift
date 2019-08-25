import Foundation
import UIKit

protocol Wireframe {
    associatedtype ViewType
    var source: ViewType { get set }
}

extension Wireframe {
    
    /// Presents the view/navigation controller.
    /// - If it's a navigation controller, it'll be modal
    /// - If it's a view controller, it'll be pushed.
    /// - Parameter destination: Destination view/navigation controller
    func present(viewController destination: UIViewController
        ) {
        guard let source = self.source as? UIViewController else {
            return
        }
        
        guard let navigator = source.navigationController else {
            source.present(destination, animated: true)
            return
        }
        
        if destination is UINavigationController {
            source.present(destination, animated: true, completion: nil)
        } else {
            navigator.pushViewController(destination, animated: true)
        }
    }
}
