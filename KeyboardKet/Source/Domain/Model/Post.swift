//
//  Post.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct Post {
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
}
