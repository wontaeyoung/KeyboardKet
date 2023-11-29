//
//  FirestoreService.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/28/23.
//

import FirebaseFirestore

protocol FirestoreService {
  typealias FirestoreField = FirestoreFieldProtocol
  
  // MARK: - Path
  func getCollectionPath(
      collection: FirestoreCollection
  ) -> CollectionReference
  
  func getDocumentPath(
      collection: FirestoreCollection,
      documentID: String
  ) -> DocumentReference
  
  func getCollectionPath(
      superCollection: FirestoreCollection,
      superDocumentID: String,
      subCollection: FirestoreCollection
  ) -> CollectionReference
  
  func getDocumentPath(
      superCollection: FirestoreCollection,
      superDocumentID: String,
      subCollection: FirestoreCollection,
      subDocumentID: String
  ) -> DocumentReference
}
