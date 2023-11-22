//
//  User.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct User {
  // MARK: - Property
  let id: UUID
  let nickname: String
  let profileImage: URL?
  let postIDs: [String]
  let createAt: Date
}
