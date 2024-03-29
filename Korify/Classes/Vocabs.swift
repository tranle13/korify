//
//  Words.swift
//  Korify
//
//  Created by Trân Lê on 3/25/24.
//

import Foundation

public class Vocabs: NSObject, NSCoding {
  
  public var vocabs: [Vocab] = []
  
  enum Key: String {
    case vocabs = "vocabs"
  }
  
  init(vocabs: [Vocab]) {
    self.vocabs = vocabs
  }

  public func encode(with coder: NSCoder) {
    coder.encode(vocabs, forKey: Key.vocabs.rawValue)
  }
  
  public required convenience init?(coder: NSCoder) {
    let dVocabs = coder.decodeObject(forKey: Key.vocabs.rawValue) as! [Vocab]
    self.init(vocabs: dVocabs)
  }
}
