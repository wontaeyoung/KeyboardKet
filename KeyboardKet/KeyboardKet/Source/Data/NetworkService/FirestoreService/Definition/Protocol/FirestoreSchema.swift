//
//  FirestoreSchema.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/27/23.
//

protocol FirestoreSchema {
  var name: String { get }
}

extension FirestoreSchema
where
Self: RawRepresentable,
Self.RawValue == String
{
  var name: String {
    return self.rawValue
  }
}
