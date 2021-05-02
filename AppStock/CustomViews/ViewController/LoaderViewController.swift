//
//  LoaderViewController.swift
//  YandexApp
//
//  Created by coder on 30.03.21.
//

import UIKit


class LoaderViewController: UIViewController{
    
    var loadingView: UIView!
    
    func showLoadingView(){
        
        loadingView = UIView(frame: view.bounds)
        loadingView.backgroundColor = .systemBackground
        view.addSubview(loadingView)
        
        let progressIndicator = UIActivityIndicatorView(style: .medium)
        progressIndicator.alpha = 0
        UIView.animate(withDuration: 0.3) {progressIndicator.alpha = 1}
        loadingView.addSubview(progressIndicator)
        
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            progressIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor)
        ])
        
        progressIndicator.startAnimating()
        
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            self.loadingView.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
}


