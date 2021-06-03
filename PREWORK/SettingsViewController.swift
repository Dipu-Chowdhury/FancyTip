//
//  SettingsViewController.swift
//  PREWORK
//
//  Created by Dipu Chowdhury on 5/24/21.
//

import UIKit

let lowTipKey = "LowTipValue"
let midTipKey = "MidTipValue"
let highTipKey = "HighTipKey"

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var level1: UILabel!
    @IBOutlet weak var level2: UILabel!
    @IBOutlet weak var level3: UILabel!
    
    @IBOutlet weak var changer1: UIStepper!
    @IBOutlet weak var changer2: UIStepper!
    @IBOutlet weak var changer3: UIStepper!
    
    var lowest: Int = 0
    var mid: Int=0
    var highest: Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowest = UserDefaults.standard.integer(forKey: lowTipKey)
        mid = UserDefaults.standard.integer(forKey: midTipKey)
        highest = UserDefaults.standard.integer(forKey: highTipKey)
        
        if (lowest == 0 && mid == 0 && highest == 0) {
            lowest = 15
            mid = 18
            highest = 20
        }
        
        level1.text = "\(lowest)"
        level2.text = "\(mid)"
        level3.text = "\(highest)"
        
        changer1.value = Double(lowest)
        changer2.value = Double(mid)
        changer3.value = Double(highest)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepper1(_ sender: UIStepper) {
        level1.text = String(Int(sender.value).description)
        lowest = Int(sender.value)
    }
    
    @IBAction func stepper2(_ sender: UIStepper) {
        level2.text = String(Int(sender.value).description)
        mid = Int(sender.value)
    }
    
    @IBAction func stepper3(_ sender: UIStepper) {
        level3.text = String((Int(sender.value).description))
        highest = Int(sender.value)
    }
    
    @IBAction func suggestions(_ sender: Any) {
        changer1.value = 15
        changer2.value = 18
        changer3.value = 20
        level1.text = String(15)
        level2.text = String(18)
        level3.text = String(20)
        lowest = 15
        mid = 18
        highest = 20
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.setValue(lowest, forKey: lowTipKey)
        UserDefaults.standard.setValue(mid, forKey: midTipKey)
        UserDefaults.standard.setValue(highest, forKey: highTipKey)
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
