//
//  FirestoreService.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/28/23.
//

import FirebaseFirestore

protocol FirestoreService {
  associatedtype FirestoreField = any FirestoreFieldProtocol
  
  func create<T: DTO>(
    col: FirestoreCollection,
    dto: T
  ) throws
}
