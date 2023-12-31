//
//  Query+.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/3/23.
//

import FirebaseFirestore

extension Query {
  typealias FirestoreField = any FirestoreFieldProtocol
  
  func query(
    field: FirestoreField,
    operation: FirestoreQueryOperation
  ) -> Query {
    switch operation {
      case .lessThan(let value):
        return self.whereField(
          field.name,
          isLessThan: value
        )
        
      case .lessThanOrEqualTo(let value):
        return self.whereField(
          field.name,
          isLessThanOrEqualTo: value
        )
        
      case .equalTo(let value):
        return self.whereField(
          field.name,
          isEqualTo: value
        )
        
      case .greaterThan(let value):
        return self.whereField(
          field.name,
          isGreaterThan: value
        )
        
      case .greaterThanOrEqualTo(let value):
        return self.whereField(
          field.name,
          isGreaterThanOrEqualTo: value
        )
        
      case .arrayContains(let value):
        return self.whereField(
          field.name,
          arrayContains: value
        )
        
      case .in(let values):
        return self.whereField(
          field.name,
          in: values
        )
        
      case .arrayContainsAny(let values):
        return self.whereField(
          field.name,
          arrayContainsAny: values
        )
        
      case .orderBy(let type):
        return self.order(
          by: field.name,
          descending: type == .descending ? true : false
        )
    }
  }
}

