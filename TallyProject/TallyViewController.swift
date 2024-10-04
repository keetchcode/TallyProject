//
//  ViewController.swift
//  TallyProject
//
//  Created by Wesley Keetch on 9/30/24.
//

import UIKit

class TallyViewController: UIViewController {
  
  @IBOutlet weak var tallyCount: UILabel!
  
  var count: Int = 0
  let settingsManager = SettingsManager.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateCountLabel()
  }
  
  @IBAction func resetButton(_ sender: Any) {
    count = 0
    updateCountLabel()
    print("Count reset")
  }
  
  @IBAction func incrementButton(_ sender: UIButton) {
    let customIncrement = settingsManager.getCustomCount()
    count += customIncrement
    updateCountLabel()
    print("Button tapped, amount incremented by \(customIncrement)")
  }
  
  func updateCountLabel() {
    tallyCount.text = "\(count)"
  }
}

class SettingsManager {
  
  static let shared = SettingsManager()
  
  var customCount: Int?
  
  func getCustomCount() -> Int {
    return customCount ?? 1
  }
  
  func setCustomCount(_ newCount: Int) {
    customCount = newCount
  }
  
  func resetSettings() {
    customCount = nil
  }
}
