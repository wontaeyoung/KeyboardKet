//
//  Review.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

import Foundation

struct Review: Model {
  enum TradeType: String, Codable {
    case purchase
    case sale
  }
  
  // MARK: - Property
  let id: UUID
  let postID: UUID
  let traderID: UUID
  let tradeType: TradeType
  let createAt: Date
  
  // MARK: - Mapping
  func toDTO() throws -> DTO {
    return ReviewDTO(
      id: id.uuidString,
      postID: postID.uuidString,
      traderID: traderID.uuidString,
      tradeType: tradeType,
      createAt: createAt
    )
  }
}
