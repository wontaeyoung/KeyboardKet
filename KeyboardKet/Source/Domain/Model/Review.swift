//
//  Review.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

import Foundation

struct Review {
  enum TradeType {
    case purchase
    case sale
  }
  
  // MARK: - Property
  let id: UUID
  let postID: UUID
  let traderID: UUID
  let tradeType: TradeType
  let createAt: Date
}
