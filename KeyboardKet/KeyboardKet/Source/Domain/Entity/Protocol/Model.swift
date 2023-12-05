//
//  Model.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

protocol Model {
  associatedtype DTOImpl
  
  func toDTO() throws -> DTOImpl
}
