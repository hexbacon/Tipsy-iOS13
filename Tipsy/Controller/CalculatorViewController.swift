//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var totalAmount : Double = 0.0
    var totalSplit : Double = 0.0
    var pct : Double = 0.0
    var split : Double = 0.0
    var amount : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        unSelect()
        billTextField.endEditing(true)
        sender.isSelected = true
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        pct = 0.0
        amount = Double(billTextField.text!) ?? 0.0
        split = Double(splitLabel.text!) ?? 0.0
        if(zeroPctButton.isSelected) {
            pct = 0.0
        } else if(tenPctButton.isSelected) {
            pct = 0.1
        } else if(twentyPctButton.isSelected) {
            pct = 0.2
        }
        totalAmount = (amount * pct) + amount
        totalSplit = totalAmount / split
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func unSelect() -> Void {
        tenPctButton.isSelected = false
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.splitAmount = String(totalSplit)
            destinationVC.splitText = "Split betweene \(String(format: "%.0f", split )) people with \(String(format: "%.0f", (pct * 100)))% tip."
        }
    }
}

