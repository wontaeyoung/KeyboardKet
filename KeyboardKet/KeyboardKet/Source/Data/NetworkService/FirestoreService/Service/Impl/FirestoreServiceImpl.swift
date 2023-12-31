//
//  FirestoreServiceImpl.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/29/23.
//

import FirebaseFirestore

final class FirestoreServiceImpl: FirestoreService {
  // MARK: - Property
  private let firestore: Firestore
  
  // MARK: - Initializer
  init(firestore: Firestore = .firestore()) {
    self.firestore = firestore
  }
}

// MARK: - CRUD Interface
extension FirestoreServiceImpl {
  func create<T: DTO>(
    col collection: FirestoreCollection,
    dto: T
  ) throws {
    guard let id = dto.id as? String else {
      throw DTOError.castIDFailed
    }
    
    let docPath: DocumentReference = getDocumentPath(
      col: collection,
      docID: id
    )
    
    try addDocument(
      docPath: docPath,
      dto: dto
    )
  }
  
  func fetch<T: DTO>(
    col collection: FirestoreCollection,
    docID documentID: String
  ) async throws -> T {
    let path: DocumentReference = getDocumentPath(
      col: collection,
      docID: documentID
    )
    
    let document: DocumentSnapshot = try await getDocument(docPath: path)
    
    let dto: T = try document.data(as: T.self)
    
    return dto
  }
  
  func fetch<T: DTO>(
    col collection: FirestoreCollection
  ) async throws -> [T] {
    let path: CollectionReference = getCollectionPath(col: collection)
    
    let documents: [QueryDocumentSnapshot] = try await getDocuments(colPath: path)
    
    let dtoArray: [T] = try documents.map { document in
      try document.data(as: T.self)
    }
    
    return dtoArray
  }
  
  func fetch<T: DTO, U: FirestoreFieldProtocol>(
    col collection: FirestoreCollection,
    field firestoreField: U,
    operation: FirestoreQueryOperation
  ) async throws -> [T] {
    let path: CollectionReference = getCollectionPath(col: collection)
    
    let documents: [QueryDocumentSnapshot] = try await getDocuments(
      colPath: path,
      field: firestoreField,
      operation: operation
    )
    
    let dtoArray: [T] = try documents.map { document in
      try document.data(as: T.self)
    }
    
    return dtoArray
  }
  
  func update<T: DTO, U: FirestoreFieldProtocol>(
    col collection: FirestoreCollection,
    dto: T,
    updateFields: [U]
  ) throws {
    guard let id = dto.id as? String else {
      throw DTOError.castIDFailed
    }
    
    let path: DocumentReference = getDocumentPath(
      col: collection,
      docID: id
    )
    
    let fields: [String: Any] = makeFields(
      updateFields: updateFields,
      dto: dto
    )
    
    updateDocument(
      docPath: path,
      fields: fields
    )
  }
  
  func delete(
    col colledtion: FirestoreCollection,
    docID documentID: String
  ) {
    let path: DocumentReference = getDocumentPath(
      col: colledtion,
      docID: documentID
    )
    
    deleteDocument(docPath: path)
  }
}


// MARK: - Private
private extension FirestoreServiceImpl {
  // MARK: - Path
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
  
  // MARK: - Create
  func addDocument<T: DTO>(
    docPath documentPath: DocumentReference,
    dto: T
  ) throws {
    try documentPath.setData(from: dto)
  }
  
  // MARK: - Read
  func makeQuery(
    _ collectionPath: CollectionReference,
    field: any FirestoreFieldProtocol,
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
    field: any FirestoreFieldProtocol,
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
  
  // MARK: - Update
  func makeFields<T: DTO>(
    updateFields: [any FirestoreFieldProtocol],
    dto: T
  ) -> [String: Any] {
    let fieldDictionary = dto.asDictionary
    var fields: [String: Any] = [:]
    
    updateFields.forEach { field in
      guard let value = fieldDictionary[field.name] else { return }
      
      fields.updateValue(value, forKey: field.name)
    }
    
    return fields
  }
  
  func updateDocument(
    docPath: DocumentReference,
    fields: [String: Any]
  ) {
    docPath.updateData(fields)
  }
  
  func deleteDocument(
    docPath: DocumentReference
  ) {
    docPath.delete()
  }
}
