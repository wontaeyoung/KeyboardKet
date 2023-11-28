//
//  FirestoreField.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/27/23.
//

enum FirestoreField {
  enum User: String, FirestoreSchema {
    case id
    case nickname
    case profileImage
    case postIDs
    case createAt
  }
  
  enum Post: String, FirestoreSchema {
    case id
    case title
    case content
    case createAt
    case updateAt
    case productImages
    case status
  }
  
  enum Review: String, FirestoreSchema {
    case id
    case postID
    case traderID
    case tradeType
    case createAt
  }
}
