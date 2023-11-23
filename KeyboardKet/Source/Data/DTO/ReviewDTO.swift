//
//  ReviewDTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

import Foundation

struct ReviewDTO {
  // MARK: - Property
  let id: String
  let postID: String
  let traderID: String
  let tradeType: Review.TradeType
  let createAt: Date
}
