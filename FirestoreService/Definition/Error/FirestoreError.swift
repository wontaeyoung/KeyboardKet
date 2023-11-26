//
//  FirestoreError.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/27/23.
//

import FirebaseFirestore

enum FirestoreError {
  case encodeError
  case decodeError
  case noDocument(document: DocumentSnapshot)
  case emptyCollection
  case emptyQuery
  case unknown
}
