//
//  HomeViewController.swift
//  Korify
//
//  Created by Trân Lê on 3/25/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

  @IBOutlet weak var groupsCV: UICollectionView!
  
  private let temp: [String] = ["orange","apple","peach"]
  private let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
  private let itemsPerRow: CGFloat = 2
  private var selected: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    groupsCV.delegate = self
    groupsCV.dataSource = self
    self.groupsCV.register(UINib(nibName: "GroupCell", bundle: nil), forCellWithReuseIdentifier: Constants.GroupCS.cellId)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "HometoVocabs" {
      if let destVC = segue.destination as? VocabsViewController {
        destVC.groupName = selected
      }
    }
  }
}

// MARK: - CollectionView Configs
extension HomeViewController {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return temp.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.GroupCS.cellId, for: indexPath) as? GroupCell else { fatalError("Unable to dequeue GroupCell") }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    selected = temp[indexPath.row]
    performSegue(withIdentifier: "HometoVocabs", sender: self)
    return true
  }
}

// MARK: - CollectionView Layout Configs
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let leftoverSpace = collectionView.frame.width - paddingSpace
    let widthPerItem = leftoverSpace / itemsPerRow
    return CGSize(width: widthPerItem, height: widthPerItem)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
}
