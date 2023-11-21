//
//  DTO.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/22/23.
//

protocol DTO: Codable {
    func toModel() -> Model
}
