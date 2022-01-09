//
//  UIViewController+Extension.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 20/12/21.
//

import UIKit

extension UIViewController {
    
    func showLoading() {
        let loaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        loaderView.tag = 999
        loaderView.backgroundColor = .black.withAlphaComponent(0.3)
        
        let loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        loader.center = loaderView.center
        
        loader.style = .large
        loader.color = .black
        loader.startAnimating()
        
        loaderView.addSubview(loader)
        
        view.addSubview(loaderView)
    }
    
    func hideLoading() {
        view.viewWithTag(999)?.removeFromSuperview()
    }
    
    func showAlert(title: String, message: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
