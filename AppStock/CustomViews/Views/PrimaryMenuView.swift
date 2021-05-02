import UIKit

class PrimaryMenuView: UIView {
    
    let stockPointMenuView   = PrimaryMenuButton(title: "Stock")
    let favoritePointMenuView   = PrimaryMenuButton(title: "Favorite")
    
    override init(frame: CGRect){
        super.init(frame:frame)
        configure()
        configureActionButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureActionButton(){
        stockPointMenuView.addTarget(self, action: #selector(tapStockButton), for: .touchUpInside)
        favoritePointMenuView.addTarget(self, action: #selector(tapFavoriteButton), for: .touchUpInside)
    }
    
    @objc func tapStockButton(){
        print("Stock")
        setNoActiveButton(sender: favoritePointMenuView)
        setActiveButton(sender: stockPointMenuView)
    }
    
    @objc func tapFavoriteButton(){
        print("Favorite")
        setNoActiveButton(sender: stockPointMenuView)
        setActiveButton(sender: favoritePointMenuView)
    }
    
    func setNoActiveButton(sender: PrimaryMenuButton){
        sender.set(fontColor: 0xBABABA, sizeFont: 18)
        sender.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    func setActiveButton(sender: PrimaryMenuButton){
        sender.set(fontColor: 0x1A1A1A, sizeFont: 28)
        sender.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints  = false
        
        self.addSubviews(stockPointMenuView,favoritePointMenuView)
        NSLayoutConstraint.activate([
            stockPointMenuView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constraints.marginZero),
            stockPointMenuView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constraints.marginZero),
            
            favoritePointMenuView.leadingAnchor.constraint(equalTo: stockPointMenuView.trailingAnchor, constant: 20),
            favoritePointMenuView.bottomAnchor.constraint(equalTo: stockPointMenuView.bottomAnchor, constant: Constraints.marginZero)
        ])
    }
    
}
