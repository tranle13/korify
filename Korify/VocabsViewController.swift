//
//  VocabsViewController.swift
//  Korify
//
//  Created by Trân Lê on 3/26/24.
//

import UIKit

class VocabsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var vocabsTV: UITableView!
  @IBOutlet weak var groupNameLabel: UILabel!

  var groupName: String?

  override func viewDidLoad() {
    super.viewDidLoad()
    vocabsTV.delegate = self
    vocabsTV.dataSource = self
    groupNameLabel.text = groupName ?? "Vocabs"
  }

  @IBAction func backTapped(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
}

extension VocabsViewController {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VocabsCS.cellId, for: indexPath)
    cell.backgroundColor = .purple
    return cell
  }
}
