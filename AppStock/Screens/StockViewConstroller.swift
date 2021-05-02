import UIKit

class StockViewConstroller: UIViewController {

    let searchTextField   = SearchTextField()
    let primaryMenuView   = PrimaryMenuView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        showLoadingView()
        view.backgroundColor = .systemBackground
        configureSearchTextField()
        configurePrimaryMenuView()
    }
    
    
    func configureSearchTextField(){
        view.addSubview(searchTextField)
        searchTextField.delegate = self
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constraints.margin),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.margin),
            searchTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 15),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    func configurePrimaryMenuView() {
        view.addSubview(primaryMenuView)
        NSLayoutConstraint.activate([
            primaryMenuView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: Constraints.margin),
            primaryMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constraints.margin),
            primaryMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.margin),
            primaryMenuView.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

}

extension StockViewConstroller: UITextFieldDelegate {
    
}
