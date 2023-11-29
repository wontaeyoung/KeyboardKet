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
      col collection: FirestoreCollection
  ) -> CollectionReference
  
  func getDocumentPath(
      col collection: FirestoreCollection,
      docID documentID: String
  ) -> DocumentReference
  
  func getCollectionPath(
      supCol superCollection: FirestoreCollection,
      supDocID superDocumentID: String,
      subCol subCollection: FirestoreCollection
  ) -> CollectionReference
  
  func getDocumentPath(
      supCol superCollection: FirestoreCollection,
      supDocID superDocumentID: String,
      subCol subCollection: FirestoreCollection,
      subDocID subDocumentID: String
  ) -> DocumentReference
  
  // MARK: - Create
  func addDocument(
      docPath documentPath: DocumentReference,
      dto: DTO
  ) throws
}
