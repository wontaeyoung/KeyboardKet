//
//  DTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

protocol DTO: Codable, Identifiable {
  associatedtype ModelImpl: Model
  
  func toModel() throws -> ModelImpl
}

extension DTO {
  var asDictionary: [String: Any] {
    let mirror: Mirror = Mirror(reflecting: self)
    var dictionary: [String: Any] = [:]
    
    mirror.children.forEach { property in
      guard let key = property.label else { return }
      
      dictionary.updateValue(property.value, forKey: key)
    }
    
    return dictionary
  }
}
