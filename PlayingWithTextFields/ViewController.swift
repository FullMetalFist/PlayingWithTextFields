//
//  ViewController.swift
//  PlayingWithTextFields
//
//  Created by Michael Vilabrera on 1/26/18.
//  Copyright © 2018 Michael Vilabrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     // leaving focus from the uitextfield,
     these for methods are called in this order:
     shouldBeginEditing called
     shouldEndEditing called
     didEndEditing with reason called
     
     // placing focus into a new uitextfield, this method is called:
     didBeginEditing called
     */
    
    var textFieldManager = TextFieldManager()
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    
    
    var something: String = ""
    
    var sourSoul = "Sour SOul"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.delegate = self
        textField2.delegate = self
        
        textField2.becomeFirstResponder()
        textField1.insertText(sourSoul)
        
    }
}

extension ViewController: UITextFieldDelegate {
     // return NO to disallow editing.
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("shouldBeginEditing called")
        return true
    }
    
     // became first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("didBeginEditing called")
        textField.text = ""
    }
    
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("shouldEndEditing called")
        return true
    }
    
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("didEndEditing called")
    }
    
     // if implemented, called in place of textFieldDidEndEditing:
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print("didEndEditing with reason called")
    }
    
    
     // return NO to not change text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersInRange called")
        return true
    }
    
    
    // called when clear button pressed. return NO to ignore (no notifications)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear called")
        return true
    }
    
    // called when 'return' key pressed. return NO to ignore
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn called")
        
        if textField == textField1 {
            textField2.text = ""
            textField2.insertText(textField1.text!)
        } else {
            textField1.text = ""
            textField1.insertText(textField2.text!)
        }
        return true
    }
}

