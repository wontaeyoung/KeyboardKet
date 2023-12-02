//
//  FirestoreServiceImpl.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/29/23.
//

import FirebaseFirestore

final class FirestoreServiceImpl: FirestoreService {
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
  func addDocument<T: DTO>(
    docPath documentPath: DocumentReference,
    dto: T
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
  
  func getDocuments(
    colPath collectionPath: CollectionReference,
    field: FirestoreField,
    operation: FirestoreQueryOperation
  ) async throws -> [QueryDocumentSnapshot] {
    let query: Query = makeQuery(
      collectionPath,
      field: field,
      operation: operation
    )
    
    let snapshot: QuerySnapshot = try await query.getDocuments()
    
    guard snapshot.isEmpty == false else {
      throw FirestoreError.emptyQuery
    }
    
    return snapshot.documents
  }
  
  // MARK: - Private
  private func makeQuery(
    _ collectionPath: CollectionReference,
    field: FirestoreField,
    operation: FirestoreQueryOperation
  ) -> Query {
    switch operation {
      case .lessThan(let value):
        return collectionPath.whereField(
          field.name,
          isLessThan: value
        )
        
      case .lessThanOrEqualTo(let value):
        return collectionPath.whereField(
          field.name,
          isLessThanOrEqualTo: value
        )
        
      case .equalTo(let value):
        return collectionPath.whereField(
          field.name,
          isEqualTo: value
        )
        
      case .greaterThan(let value):
        return collectionPath.whereField(
          field.name,
          isGreaterThan: value
        )
        
      case .greaterThanOrEqualTo(let value):
        return collectionPath.whereField(
          field.name,
          isGreaterThanOrEqualTo: value
        )
        
      case .arrayContains(let value):
        return collectionPath.whereField(
          field.name,
          arrayContains: value
        )
        
      case .in(let values):
        return collectionPath.whereField(
          field.name,
          in: values
        )
        
      case .arrayContainsAny(let values):
        return collectionPath.whereField(
          field.name,
          arrayContainsAny: values
        )
        
      case .orderBy(let type):
        return collectionPath.order(
          by: field.name,
          descending: type == .descending ? true : false
        )
    }
  }
}
