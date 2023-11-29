//
//  AppError.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

protocol AppError: Error {
    var errorDescription: String { get }
}

