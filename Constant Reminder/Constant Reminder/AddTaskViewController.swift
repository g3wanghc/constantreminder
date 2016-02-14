//
//  AddTaskViewController.swift
//  Constant Reminder
//
//  Created by Hanchen Wang on 2016-02-13.
//  Copyright © 2016 Asian Social Rejects. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var title_text: UITextField!
    @IBOutlet weak var desc_text: UITextField!
    @IBOutlet weak var prority: UISegmentedControl!
    @IBOutlet weak var create: UIButton!

    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.dismissKeyboard()
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dismiss the keyboard on tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        title_text.delegate = self
        desc_text.delegate = self
        
        desc_text.contentVerticalAlignment = UIControlContentVerticalAlignment.Top
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}