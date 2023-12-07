//
//  FirebaseAuthServiceImpl.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/8/23.
//

import FirebaseAuth

final class FirebaseAuthServiceImpl {
  // MARK: - Property
  private let auth: Auth = .auth()
  
  // MARK: - Method
  func signUp(
    email: String,
    password: String
  ) async throws {
    do {
      try await auth.createUser(
        withEmail: email,
        password: password
      )
    } catch let nsError as NSError {
      let errorCode: AuthErrorCode.Code = AuthErrorCode(_nsError: nsError).code
      
      switch errorCode {
        case .networkError:
          throw FirebaseAuthError.networkError
          
        default:
          throw FirebaseAuthError.unknown
      }
    }
  }
}
