//
//  ViewController.swift
//  PeterPan_0502
//
//  Created by Spade Jack on 5/2/16.
//  Copyright © 2016 galileo.jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var textCountLabel: UILabel!
    
    @IBOutlet weak var textV: UITextView!
    @IBOutlet weak var textViewCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: TextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return true }
        let newLength = text.utf16.count + string.utf16.count - range.length
        textCountLabel.text = "\(newLength)"
        return newLength <= 10 // Bool
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
    }
    
    //MARK: TextViewDelegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {

        let newLength = textView.text.characters.count + (text.characters.count - range.length)
        
        if  newLength <= 10{
            textViewCountLabel.text = "\(newLength)"
        }
        return newLength <= 10
    }
}

