//
//  SettingsViewController.swift
//  TallyProject
//
//  Created by Wesley Keetch on 10/4/24.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var customCountTextField: UITextField!
  @IBOutlet weak var instructionLabel: UILabel!
  
  let settingsManager = SettingsManager.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    instructionLabel.text = ""
  }
  
  @IBAction func setCustomCountButton(_ sender: UIButton) {
    if let text = customCountTextField.text, let newCount = Int(text) {
      settingsManager.setCustomCount(newCount)
      instructionLabel.text = ""
      customCountTextField.text = ""
      print("Custom count set to \(newCount)")
      instructionLabel.text = "Custom count set to \(newCount)"
    } else {
      print("Invalid number input")
      instructionLabel.text = "Please input a whole number"
    }
  }
}
