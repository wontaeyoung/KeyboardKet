//
//  FirestoreService.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/28/23.
//

import FirebaseFirestore

protocol FirestoreService {
  func create<T: DTO>(
    col collection: FirestoreCollection,
    dto: T
  ) throws
  
  func fetch<T: DTO>(
    col collection: FirestoreCollection,
    docID documentID: String
  ) async throws -> T
  
  func fetch<T: DTO>(
    col collection: FirestoreCollection
  ) async throws -> [T]
  
  func fetch<T: DTO, U: FirestoreFieldProtocol>(
    col collection: FirestoreCollection,
    field firestoreField: U,
    operation: FirestoreQueryOperation
  ) async throws -> [T]
  
  func update<T: DTO, U: FirestoreFieldProtocol>(
    col collection: FirestoreCollection,
    dto: T,
    updateFields: [U]
  ) throws
}
