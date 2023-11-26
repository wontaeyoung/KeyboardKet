//
//  FirestoreSchema.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/27/23.
//

protocol FirestoreSchema
where
Self: RawRepresentable,
Self.RawValue == String 
{
  var name: String { get }
}
