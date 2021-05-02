import UIKit

class SearchTextField: UITextField {
    
    var iconLoopView = UIImageView()
    var clearButton = UIButton()
    var iconContainerLoopView = UIView()
    var iconContainerClearView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setLeftImage(image: UIImage(named: "icon-search"))
        setClearButton(image: UIImage(named: "icon-close"))
        self.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        self.addTarget(self, action: #selector(editingDidBegin(_:)), for: .editingDidBegin)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius        = 25
        layer.borderWidth         = 1
        layer.borderColor         = UIColor.black.cgColor
        
        textColor                 = .black
        tintColor                 = .black
        adjustsFontSizeToFitWidth = true
        font                      = UIFont.normalFont(ofSize: 16)
        
        autocorrectionType        = .no
        returnKeyType             = .go
//        clearButtonMode           = .never
//        rightViewMode             = .whileEditing
        attributedPlaceholder     = NSAttributedString(string: "Find company or ticker", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black])
        
    }
    
    private func setLeftImage(image: UIImage!) {
        iconContainerLoopView = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: Views.sizeContainerTextField,
                                                     height: Views.sizeContainerTextField))
        iconLoopView = UIImageView(frame:CGRect(x: (CGFloat(Views.sizeContainerTextField) - 15)/2,
                                                y: (CGFloat(Views.sizeContainerTextField) - Button.sizeButton)/2,
                                                width: Button.sizeButton,
                                                height: Button.sizeButton))
        iconLoopView.image = image
        iconContainerLoopView.addSubview(iconLoopView)
        leftView = iconContainerLoopView
        leftViewMode = .always

    }
    
    private func showButton(){
        UIView.animate(withDuration: 0.3) {
            self.clearButton.alpha = 1
        }
    }
    private func hideButton(){
        UIView.animate(withDuration: 0.3) {
            self.clearButton.alpha = 0
        }
    }
    
    private  func setClearButton(image: UIImage!) {
        iconContainerClearView = UIView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: Views.sizeContainerTextField,
                                                      height: Views.sizeContainerTextField))
        clearButton = UIButton(frame: CGRect(x: CGFloat(Views.sizeContainerTextField/2) - CGFloat(Button.sizeButton/2),
                                             y: (CGFloat(Views.sizeContainerTextField) - Button.sizeButton)/2,
                                             width: Button.sizeButton,
                                             height: Button.sizeButton))
        clearButton.setImage(UIImage(named: "icon-close"), for: .normal)
        clearButton.alpha = 0
        clearButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        iconContainerClearView.addSubview(clearButton)
        self.rightView = iconContainerClearView
        self.clearButtonMode = .never
        self.rightViewMode = .whileEditing
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        text != "" ? showButton() : hideButton()
    }
    @objc func editingDidBegin(_ textField: UITextField) {
        attributedPlaceholder = nil
    }
    
    @objc func clearTextField() {
        self.text = ""
        hideButton()
        self.endEditing(true)
        attributedPlaceholder     = NSAttributedString(string: "Find company or ticker", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
}
