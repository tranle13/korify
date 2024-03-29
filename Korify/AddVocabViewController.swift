//
//  AddVocabViewController.swift
//  Korify
//
//  Created by Trân Lê on 3/26/24.
//

import UIKit

class AddVocabViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var wordTF: UITextField!
  @IBOutlet weak var meaningTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    wordTF.delegate = self
    meaningTF.delegate = self
    wordTF.becomeFirstResponder()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
      case wordTF:
        meaningTF.becomeFirstResponder()
      default:
        validateAndSave()
    }
    return true
  }

  @IBAction func backTapped(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

  @IBAction func saveTapped(_ sender: UIButton) {
    validateAndSave()
  }
  
  private func validateAndSave() {
    let trimmedWord = wordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    let trimmedMeaning = meaningTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    guard let w = trimmedWord, let m = trimmedMeaning else { return }
    // TODO: save data
    print("u did it")
    wordTF.text = ""
    meaningTF.text = ""
    wordTF.becomeFirstResponder()
  }
}
