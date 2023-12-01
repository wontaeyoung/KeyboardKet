//
//  FirestoreQueryOperation.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/28/23.
//

enum FirestoreQueryOperation {
  enum SortType {
    case ascending
    case descending
  }
  
  case lessThan(value: Any)
  case lessThanOrEqualTo(value: Any)
  case equalTo(value: Any)
  case greaterThan(value: Any)
  case greaterThanOrEqualTo(value: Any)
  case arrayContains(value: Any)
  case `in`(values: [Any])
  case arrayContainsAny(values: [Any])
  case orderBy(value: Any, type: SortType)
}
