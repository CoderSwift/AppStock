import UIKit

enum  Views {
    static let sizeContainerTextField           = 50
}

enum  Button {
    static let sizeButton:CGFloat    = 25
}

enum  Images {
    static let logoStock                        = UIImage(named: "stock-img")
}

enum ScreenSize {
    static let width                            = UIScreen.main.bounds.size.width
    static let height                           = UIScreen.main.bounds.size.height
    static let maxLength                        = max(ScreenSize.width, ScreenSize.height)
    static let minLength                        = min(ScreenSize.width, ScreenSize.height)
}

enum Constraints {
    static let margin:CGFloat = 15
    static let marginZero:CGFloat = 0
}
