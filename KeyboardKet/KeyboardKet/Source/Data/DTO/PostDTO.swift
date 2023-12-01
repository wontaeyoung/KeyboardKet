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
  func toModel() throws -> Model {
    guard let uuid = UUID(uuidString: id) else {
      throw DTOError.mapToModelFailed
    }
    
    var urls: [URL] = []
    
    try productImages.forEach { urlStr in
      guard let url = URL(string: urlStr) else {
        throw DTOError.mapToModelFailed
      }
      
      urls.append(url)
    }
    
    return Post(
      id: uuid,
      title: title,
      content: content,
      createAt: createAt,
      updateAt: updateAt,
      previewImage: nil,
      productImages: urls,
      status: status
    )
  }
}
