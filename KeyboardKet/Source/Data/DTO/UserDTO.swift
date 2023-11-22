//
//  UserDTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct UserDTO {
  // MARK: - Property
  let id: String
  let nickname: String
  let profileImage: String
  let postIDs: [String]
  let createAt: Date
  let updateAt: Date
}
