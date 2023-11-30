//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Christopher Mena on 11/26/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var splitAmount : String?
    var splitText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.text = splitText ?? ""
        totalLabel.text = splitAmount ?? ""
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
