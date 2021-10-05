//
//  HorViewController.swift
//  Calculator
//
//  Created by yuanhang tangle on 2021/10/4.
//  Copyright © 2021 yuanhang. All rights reserved.
//

import UIKit

class HorViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var isTyping = false
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.display.text! = "0"
    }
    
    var digitOnDisplay: String{
        get { return self.display.text! }
        set { self.display.text! = newValue }
    }

    @IBAction func numberTouched(_ sender: UIButton) {
        if isTyping{
            self.display.text!.append(sender.currentTitle!)
        }else{
            self.display.text! = sender.currentTitle!
            isTyping = true
        }
        
    }
    
    
    @IBAction func clearTouched(_ sender: UIButton) {
        self.display.text = "0"
        self.isTyping = false
    }
    
    @IBAction func operatorTouched(_ sender: UIButton) {
        if let op = sender.currentTitle{
            if let result = calculator.performOp(operation: op, operand: Double(self.display.text!)!){
                digitOnDisplay = String(result)
            }
            
            isTyping = false
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if size.width < size.height{
            let VC = storyboard.instantiateViewController(identifier: "VerViewController")
            show(VC, sender: self)
        }
    }
    
}
