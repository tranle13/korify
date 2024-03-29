//
//  Word.swift
//  Korify
//
//  Created by Trân Lê on 3/25/24.
//

import Foundation

public class Vocab: NSObject, NSCoding {
  
  public var koreanWord: String = ""
  public var englishWord: String = ""
  
  enum Key: String {
    case korean = "korean"
    case english = "english"
  }
  
  init(koreanWord: String, englishWord: String) {
    self.koreanWord = koreanWord
    self.englishWord = englishWord
  }
  
  public override init() {
    super.init()
  }

  public func encode(with coder: NSCoder) {
    coder.encode(koreanWord, forKey: Key.korean.rawValue)
    coder.encode(englishWord, forKey: Key.english.rawValue)
  }
  
  public required convenience init?(coder: NSCoder) {
    let koreanW = coder.decodeObject(forKey: Key.korean.rawValue) as! String
    let englishW = coder.decodeObject(forKey: Key.english.rawValue) as! String
    self.init(koreanWord: koreanW, englishWord: englishW)
  }
}
