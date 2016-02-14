//
//  SecondViewController.swift
//  Constant Reminder
//
//  Created by TIANCHEN GU on 2016-02-02.
//  Copyright © 2016 Asian Social Rejects. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var title_text: UITextField!
    @IBOutlet weak var desc_text: UITextField!
    @IBOutlet weak var prority: UISegmentedControl!
    @IBOutlet weak var create: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}