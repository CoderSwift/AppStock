import UIKit

class PrimaryMenuButton: UIButton {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title:String, fontSize: CGFloat = 18, fontColor: Int = 0xBABABA) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.init(hexCode: fontColor), for: .normal)
        self.titleLabel?.font = UIFont.boldFont(ofSize: fontSize)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel?.font = UIFont.boldFont(ofSize: 18)
        tintColor = UIColor.init(hexCode: 0xBABABA)
        backgroundColor = .red
    }
    
    func set(fontColor: Int, sizeFont: CGFloat) {
        setTitleColor(UIColor.init(hexCode: fontColor), for: .normal)
        titleLabel?.font = UIFont.boldFont(ofSize: sizeFont)
    }
    
}
