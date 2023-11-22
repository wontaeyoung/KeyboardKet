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
  func toModel() -> Model {
    return User(
      id: UUID(uuidString: id) ?? UUID(),
      nickname: nickname,
      profileImage: URL(string: profileImage),
      postIDs: postIDs,
      createAt: createAt
    )
  }
}
