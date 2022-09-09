//
//  extensionTextField.swift
//  Parking
//
//  Created by Usr_Prime on 08/09/22.
//

import UIKit

extension UITextField {
    
    func addToolBar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = Colors.blue
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Concluído", style: .done, target: self, action: #selector(self.cancelClickTextField))
        toolBar.setItems([spaceButton, cancelButton, spaceButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.inputAccessoryView = toolBar
    }

    @objc func cancelClickTextField(textField: UITextField) {
        self.resignFirstResponder()
    }
}
