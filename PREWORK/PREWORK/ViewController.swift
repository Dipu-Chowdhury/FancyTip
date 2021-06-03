//
//  ViewController.swift
//  PREWORK
//
//  Created by Dipu Chowdhury on 5/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var sizeNum: UILabel!
    @IBOutlet weak var perPersonTotal: UILabel!
    @IBOutlet weak var perPersonTextBox: UILabel!
    @IBOutlet weak var partySizeTextBox: UILabel!
    @IBOutlet weak var switchToShowMore: UISwitch!
    
    // UI animations
    func hideExtra () {
        sizeNum.isHidden = true
        sizeSlider.isHidden = true
        perPersonTotal.isHidden = true
        perPersonTextBox.isHidden = true
        partySizeTextBox.isHidden = true
    }
    func showExtra() {
        sizeNum.isHidden = false
        sizeSlider.isHidden = false
        perPersonTotal.isHidden = false
        perPersonTextBox.isHidden = false
        partySizeTextBox.isHidden = false
    }
    
    // Using local specific currency
    let currencyFormatter = NumberFormatter()
    func currencyformatting () {
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = NSLocale.current
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make bill text always the first responder
        billAmountTextField.becomeFirstResponder()
        self.title = "Fancy Tip"
        
        changeSegment()
        sizeNum.text = String(1)
        sizeSlider.value = 1
        
        switchToShowMore.isOn = false
        hideExtra()
        
        self.billAmountTextField.placeholder = NSLocale.current.currencySymbol
        
        currencyformatting()
        self.tipAmountLabel.text = currencyFormatter.string(from: 0.00)
        self.totalLabel.text = currencyFormatter.string(from: 0.00)
        self.perPersonTotal.text = currencyFormatter.string(from: 0.00)
    }
    
    func changeSegment () {
        tipControl.setTitle("\(UserDefaults.standard.integer(forKey: lowTipKey))%", forSegmentAt: 0)
        tipControl.setTitle("\(UserDefaults.standard.integer(forKey: midTipKey))%", forSegmentAt: 1)
        tipControl.setTitle("\(UserDefaults.standard.integer(forKey: highTipKey))%", forSegmentAt: 2)
    }
    
    var tip1: Double = Double(UserDefaults.standard.float(forKey: lowTipKey)/100.0)
    var tip2: Double = Double(UserDefaults.standard.float(forKey: midTipKey)/100.0)
    var tip3: Double = Double(UserDefaults.standard.float(forKey: highTipKey)/100.0)
    
    func changeTipKeys () {
        changeSegment()
        tip1 = Double(UserDefaults.standard.float(forKey: lowTipKey)/100.0)
        tip2 = Double(UserDefaults.standard.float(forKey: midTipKey)/100.0)
        tip3 = Double(UserDefaults.standard.float(forKey: highTipKey)/100.0)
    }
    
    @IBAction func updateSegment(_ sender: Any) {
        changeTipKeys()
        updatePerPerson()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        sizeNum.text = String(currentValue)
    }
    
    var total = 0.00;
    func updateTotal () {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [tip1,tip2,tip3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = Double(bill + tip)
        
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        updateTotal()
    }
    
    func updatePerPerson () {
        let num = Double(sizeNum.text ?? "1") ?? 1.00
        let perPerson = total/num
        perPersonTotal.text = currencyFormatter.string(from: NSNumber(value: perPerson))
    }
    
    @IBAction func calculatePerPerson(_ sender: Any) {
        updatePerPerson()
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if (switchToShowMore.isOn == true) { showExtra() }
        else { hideExtra()}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeTipKeys()
        updateTotal()
        updatePerPerson()
    }
}
