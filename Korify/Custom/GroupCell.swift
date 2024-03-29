//
//  GroupCell.swift
//  Korify
//
//  Created by Trân Lê on 3/25/24.
//

import UIKit

class GroupCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var groupLabel: UILabel!
  @IBOutlet weak var parentContainerView: UIView!
  @IBOutlet weak var containerView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    parentContainerView.layer.cornerRadius = 15
    containerView.layer.cornerRadius = 15
    containerView.layer.borderWidth = 2
    containerView.layer.borderColor = CGColor(red: 0.03, green: 0.04, blue: 0.02, alpha: 1.00)
  }

}
