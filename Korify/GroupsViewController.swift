//
//  ViewController.swift
//  Korify
//
//  Created by Trân Lê on 3/24/24.
//

import UIKit
import CoreData

class GroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
  @IBOutlet weak var groupsTBV: UITableView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var button: UIButton!
  
  var decks: [Deck] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    groupsTBV.dataSource = self
    groupsTBV.delegate = self
    textField.delegate = self
  
    retrieveData()
  }
  
  // MARK: - CoreData configs
  func retrieveData() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext

    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupsEntity")

    do {
      let result = try managedContext.fetch(fetchRequest)
      for data in result as! [NSManagedObject] {
        let mDecks = data.value(forKey: "groups") as! [Deck]
        self.decks = mDecks
      }
      print("finished \(self.decks)")
      dump(self.decks)
    } catch {
      print("Retrieve groups failed.")
    }
  }

  func saveData() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "GroupsEntity", in: managedContext)!

    let groupsManager = NSManagedObject(entity: entity, insertInto: managedContext)
    groupsManager.setValue(self.decks, forKeyPath: "groups")

    do {
      try managedContext.save()
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }

  // MARK: - TableView configs
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    TODO: return total created groups from coredata
    return decks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
    var content = cell.defaultContentConfiguration()
    content.text = decks[indexPath.row].deckName
    cell.contentConfiguration = content
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      print("hehe")
    }
  }
  
  @IBAction func btnTapped(_ sender: UIButton) {
    let newDeck = Deck(deckName: textField.text ?? "Default", deckId: UUID().uuidString)
    decks.append(newDeck)
    saveData()
  }
}
