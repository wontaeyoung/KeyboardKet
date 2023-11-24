//
//  ReviewDTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

import Foundation

struct ReviewDTO: DTO {
  // MARK: - Property
  let id: String
  let postID: String
  let traderID: String
  let tradeType: Review.TradeType
  let createAt: Date
  
  // MARK: - Mapping
  func toModel() throws -> Model {
    guard 
      let uuid = UUID(uuidString: id),
      let postUUID = UUID(uuidString: postID),
      let traderUUID = UUID(uuidString: traderID)
    else {
      throw DTOError.mapToModelFailed
    }
    
    return Review(
      id: uuid,
      postID: postUUID,
      traderID: traderUUID,
      tradeType: tradeType,
      createAt: createAt
    )
  }
}
