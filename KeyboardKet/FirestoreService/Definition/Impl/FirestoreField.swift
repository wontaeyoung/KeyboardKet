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
}