//
//  User.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct User: Model {
  // MARK: - Property
  let id: UUID
  let nickname: String
  let profileImage: URL
  let postIDs: [String]
  let createAt: Date
  
  // MARK: - Mapping
  func toDTO() throws -> DTO {
    return UserDTO(
      id: id.uuidString,
      nickname: nickname,
      profileImage: profileImage.description,
      postIDs: postIDs,
      createAt: createAt
    )
  }
}
