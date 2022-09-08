//
//  KeyboardViewController.swift
//  Parking
//
//  Created by Usr_Prime on 06/09/22.
//

import UIKit

class KeyboardViewController: DefaultViewController {

    var wasKeyboardMoved = false
    var enableKeyboardUpMovement = true
    var enableTapOutsideToHide = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.enableKeyboardUpMovement {
            self.registerKeyboardToGoUpAndDown()
        }
        if enableTapOutsideToHide {
            self.registerViewForTapToDismiss()
        }
    }
    
    private func registerKeyboardToGoUpAndDown() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func registerViewForTapToDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
           view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if !wasKeyboardMoved {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
            wasKeyboardMoved.toggle()
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
        wasKeyboardMoved.toggle()
    }
}
