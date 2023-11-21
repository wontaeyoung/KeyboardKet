//
//  PostDTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

import Foundation

struct PostDTO {
    // MARK: - Property
    let id: String
    let title: String
    let content: String
    let createAt: Date
    let updateAt: Date
    let productImages: [String]
    let status: Post.Status
}
