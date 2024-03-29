//
//  Groups.swift
//  Korify
//
//  Created by Trân Lê on 3/25/24.
//

import Foundation

public class Decks: NSObject, NSCoding {
  public var decks: [Deck] = []
  
  enum Key: String {
    case decks = "decks"
  }
  
  init(decks: [Deck]) {
    self.decks = decks
  }
  
  public func encode(with coder: NSCoder) {
    coder.encode(decks, forKey: Key.decks.rawValue)
  }
  
  public required convenience init?(coder: NSCoder) {
    let mDecks = coder.decodeObject(forKey: Key.decks.rawValue) as! [Deck]
    self.init(decks: mDecks)
  }
}
