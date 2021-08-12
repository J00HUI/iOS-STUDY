//
//  ViewController.swift
//  hello world
//
//  Created by 이주희 on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greetLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func send(_ sender: UIButton) {
        greetLabel.text = "Hello, " + nameTF.text!
        
    }
    
    
}

