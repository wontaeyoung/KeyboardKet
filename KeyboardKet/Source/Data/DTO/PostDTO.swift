//
//  PostDTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct PostDTO: DTO {
  // MARK: - Property
  let id: String
  let title: String
  let content: String
  let createAt: Date
  let updateAt: Date
  let productImages: [String]
  let status: Post.Status
  
  // MARK: - Mapping
  func toModel() -> Model {
    return Post(
      id: UUID(uuidString: id) ?? UUID(),
      title: title,
      content: content,
      createAt: createAt,
      updateAt: updateAt,
      productImages: productImages.map { URL(string: $0) },
      status: status
    )
  }
}
