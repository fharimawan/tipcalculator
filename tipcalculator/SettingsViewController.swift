//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Farel Harimawan on 3/24/19.
//  Copyright © 2019 Farel Harimawan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let main = ViewController()
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultTipControl.selectedSegmentIndex = main.defaults.integer(forKey: "defaultTip")
        
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
    main.defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        main.defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
