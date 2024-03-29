//
//  AddGroupViewController.swift
//  Korify
//
//  Created by Trân Lê on 3/27/24.
//

import UIKit
import Photos
import PhotosUI

class AddGroupViewController: UIViewController, UITextFieldDelegate, PHPickerViewControllerDelegate {
  
  @IBOutlet weak var nameTF: UITextField!
  @IBOutlet weak var descriptionTF: UITextField!
  
  var imageConfigs = PHPickerConfiguration()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameTF.delegate = self
    descriptionTF.delegate = self
    imageConfigs.filter = .images
  }

  @IBAction func uploadCoverTapped(_ sender: UIButton) {
    let picker = PHPickerViewController(configuration: imageConfigs)
    picker.delegate = self
    present(picker, animated: true, completion: nil)
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
  
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    picker.dismiss(animated: true, completion: nil)
    
    dump(results)
  }
}
