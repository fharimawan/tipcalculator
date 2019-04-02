//
//  ViewController.swift
//  tipcalculator
//
//  Created by Farel Harimawan on 3/23/19.
//  Copyright © 2019 Farel Harimawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalView: UIView!
    
    let defaults = UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        billField.placeholder = String(NumberFormatter.localizedString(from: 0, number: NumberFormatter.Style.currency).prefix(1))
        tipLabel.text = NumberFormatter.localizedString(from: 0, number: NumberFormatter.Style.currency)
        totalLabel.text = NumberFormatter.localizedString(from: 0, number: NumberFormatter.Style.currency)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip and total labels
        tipLabel.text = NumberFormatter.localizedString(from: NSNumber(value: tip), number: NumberFormatter.Style.currency)
        totalLabel.text = NumberFormatter.localizedString(from: NSNumber(value: total), number: NumberFormatter.Style.currency)
    }
    
    @IBAction func animate(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            
            self.billField.transform = CGAffineTransform(translationX: 0, y: -125)
            self.tipControl.alpha = 1
            self.totalView.alpha = 1
            
        })
    }
    
}

