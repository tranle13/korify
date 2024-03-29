//
//  Group.swift
//  Korify
//
//  Created by Trân Lê on 3/25/24.
//

import Foundation

public class Deck: NSObject, NSCoding {
  public var deckName: String = ""
  public var deckId: String = ""
  
  enum Key: String {
    case deckName = "deckName"
    case deckId = "deckId"
  }
  
  init(deckName: String, deckId: String) {
    self.deckName = deckName
    self.deckId = deckId
  }
  
  public func encode(with coder: NSCoder) {
    coder.encode(deckName, forKey: Key.deckName.rawValue)
    coder.encode(deckId, forKey: Key.deckId.rawValue)
  }
  
  public required convenience init?(coder: NSCoder) {
    let mDeckName = coder.decodeObject(forKey: Key.deckName.rawValue) as! String
    let mDeckId = coder.decodeObject(forKey: Key.deckId.rawValue) as! String
    self.init(deckName: mDeckName, deckId: mDeckId)
  }
}
