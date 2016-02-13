//
//  SecondViewController.swift
//  Constant Reminder
//
//  Created by TIANCHEN GU on 2016-02-02.
//  Copyright © 2016 Asian Social Rejects. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var Titletext: UITextField!
    @IBOutlet weak var Destext: UITextField!
    @IBOutlet weak var Prority: UISegmentedControl!
    
    
    //for testing use only
    @IBOutlet weak var Titeltextlabel: UILabel!
    @IBOutlet weak var Destextlabel: UILabel!
    @IBOutlet weak var Proritylabel: UILabel!
    
    
    
    //TextFiel Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == Titletext{
            Titeltextlabel.text = Titletext.text
            Destext.becomeFirstResponder()
        }
        else{
            Destextlabel.text = Destext.text
            Destext.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func changePrority(sender: AnyObject) {
        
        if Prority.selectedSegmentIndex == 0{
            Proritylabel.text = "You have choose Critical Prority"
        }
        if Prority.selectedSegmentIndex == 1{
            Proritylabel.text = "You have choose Major Prority"
        }
        if Prority.selectedSegmentIndex == 2{
            Proritylabel.text = "You have choose Minor Prority"
        }
    }
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Titletext.delegate = self
        Destext.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

