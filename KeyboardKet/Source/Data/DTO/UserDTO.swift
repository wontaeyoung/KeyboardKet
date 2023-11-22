//
//  UserDTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct UserDTO: DTO {
  // MARK: - Property
  let id: String
  let nickname: String
  let profileImage: String
  let postIDs: [String]
  let createAt: Date
  
  // MARK: - Mapping
  func toModel() throws -> Model {
    guard 
      let uuid = UUID(uuidString: id),
      let url = URL(string: profileImage)
    else {
      throw DTOError.mapToModelFailed
    }
    
    return User(
      id: uuid,
      nickname: nickname,
      profileImage: url,
      postIDs: postIDs,
      createAt: createAt
    )
  }
}
