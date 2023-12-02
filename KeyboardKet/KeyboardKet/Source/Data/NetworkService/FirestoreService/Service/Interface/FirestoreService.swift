//
//  FirestoreService.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/28/23.
//

import FirebaseFirestore

protocol FirestoreService {
  associatedtype FirestoreField = any FirestoreFieldProtocol
  
  // MARK: - Path
  func getCollectionPath(col collection: FirestoreCollection) -> CollectionReference
  
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
  func addDocument<T: DTO>(
    docPath documentPath: DocumentReference,
    dto: T
  ) throws
  
  // MARK: - Read
  func getDocument(docPath documentPath: DocumentReference) async throws -> DocumentSnapshot
  
  func getDocuments(colPath collectionPath: CollectionReference) async throws -> [QueryDocumentSnapshot]
  
  func getDocuments(
    colPath collectionPath: CollectionReference,
    field: FirestoreField,
    operation: FirestoreQueryOperation
  ) async throws -> [QueryDocumentSnapshot]
}
