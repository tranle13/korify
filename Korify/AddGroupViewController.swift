//
//  AddGroupViewController.swift
//  Korify
//
//  Created by Trân Lê on 3/27/24.
//

import UIKit

class AddGroupViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var nameTF: UITextField!
  @IBOutlet weak var descriptionTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameTF.delegate = self
    descriptionTF.delegate = self
  }

  @IBAction func saveTapped(_ sender: UIButton) {
    // TODO: save data to coredata
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
      case nameTF:
        descriptionTF.becomeFirstResponder()
      default:
        nameTF.becomeFirstResponder()
    }
    return true
  }
}
