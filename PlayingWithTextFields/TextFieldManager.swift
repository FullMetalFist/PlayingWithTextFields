//
//  TextFieldManager.swift
//  PlayingWithTextFields
//
//  Created by Michael Vilabrera on 1/27/18.
//  Copyright © 2018 Michael Vilabrera. All rights reserved.
//

import UIKit

class TextFieldManager: NSObject {
    
    var textField1 = UITextField()
    var textField2 = UITextField()
    
    private var textFromField = ""
    
    override init() {
        super.init()
        textField1.delegate = self
        textField2.delegate = self
    }
}

extension TextFieldManager: UITextFieldDelegate {
    
    // return NO to disallow editing.
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    // became first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textField1 {
            print("data for iHave")
        } else {
            print("data for iWant")
        }
    }
    
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    // if implemented, called in place of textFieldDidEndEditing:
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
    }
    
    // return NO to not change text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return false
    }
    
    
    // called when clear button pressed. return NO to ignore (no notifications)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return false
    }
    
    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
}
