//
//  FirestoreServiceImpl.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/29/23.
//

import FirebaseFirestore

public final class FirestoreServiceImpl: FirestoreService {
  // MARK: - Property
  private let firestore: Firestore
  
  // MARK: - Initializer
  init(firestore: Firestore = .firestore()) {
    self.firestore = firestore
  }
}
