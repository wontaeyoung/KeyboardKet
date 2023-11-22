//
//  Post.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct Post: Model {
  enum Status: String, Codable {
    case forSale
    case reserved
    case hidden
    case sold
  }
  
  // MARK: - Property
  let id: UUID
  let title: String
  let content: String
  let createAt: Date
  let updateAt: Date
  let productImages: [URL]
  let status: Status
  
  // MARK: - Mapping
  func toDTO() throws -> DTO {
    return PostDTO(
      id: id.uuidString,
      title: title,
      content: content,
      createAt: createAt,
      updateAt: updateAt,
      productImages: productImages.map { $0.description },
      status: status
    )
  }
}
