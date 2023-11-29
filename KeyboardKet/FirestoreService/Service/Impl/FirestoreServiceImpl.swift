//
//  FirestoreServiceImpl.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/29/23.
//

import FirebaseFirestore

public final class FirestoreServiceImpl: FirestoreService {
  typealias FirestoreField = any FirestoreFieldProtocol
  
  // MARK: - Property
  private let firestore: Firestore
  
  // MARK: - Initializer
  init(firestore: Firestore = .firestore()) {
    self.firestore = firestore
  }
}

// MARK: - Path
extension FirestoreServiceImpl {
  func getCollectionPath(col collection: FirestoreCollection) -> CollectionReference {
    return firestore
      .collection(collection.name)
  }
  
  func getDocumentPath(
    col collection: FirestoreCollection,
    docID documentID: String
  ) -> DocumentReference {
    return firestore
      .collection(collection.name)
      .document(documentID)
  }
  
  func getCollectionPath(
    supCol superCollection: FirestoreCollection,
    supDocID superDocumentID: String,
    subCol subCollection: FirestoreCollection
  ) -> CollectionReference {
    return firestore
      .collection(superCollection.name)
      .document(superDocumentID)
      .collection(subCollection.name)
  }
  
  func getDocumentPath(
    supCol superCollection: FirestoreCollection,
    supDocID superDocumentID: String,
    subCol subCollection: FirestoreCollection,
    subDocID subDocumentID: String
  ) -> DocumentReference {
    return firestore
      .collection(superCollection.name)
      .document(superDocumentID)
      .collection(subCollection.name)
      .document(subDocumentID)
  }
}

// MARK: - Create
extension FirestoreServiceImpl {
  func addDocument(
    docPath documentPath: DocumentReference,
    dto: DTO
  ) throws {
    try documentPath.setData(from: dto)
  }
}

// MARK: - Read
extension FirestoreServiceImpl {
  func getDocument(docPath documentPath: DocumentReference) async throws -> DocumentSnapshot {
    let document: DocumentSnapshot = try await documentPath.getDocument()
    
    guard document.exists else {
      throw FirestoreError.noDocument(document: document)
    }
    
    return document
  }
  
  func getDocuments(colPath collectionPath: CollectionReference) async throws -> [QueryDocumentSnapshot] {
    let snapshot: QuerySnapshot = try await collectionPath.getDocuments()
    
    guard snapshot.isEmpty == false else {
      throw FirestoreError.emptyCollection
    }
    
    return snapshot.documents
  }
}
