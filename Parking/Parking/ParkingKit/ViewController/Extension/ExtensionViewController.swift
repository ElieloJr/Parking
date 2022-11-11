//
//  ExtensionViewController.swift
//  Parking
//
//  Created by Usr_Prime on 22/09/22.
//

import UIKit

extension UIViewController {

    func addView(_ view: UIView) {
        self.view.addSubview(view)
    }
    
    func alertDialog(title: String, message: String, handler: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let tryAgain = UIAlertAction(
            title: "Tentar novamente",
            style: .default,
            handler: handler)
        
        alerta.addAction(tryAgain)
        present(alerta, animated: true, completion: nil)
    }

}
