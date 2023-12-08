//
//  FirebaseAuthService.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/8/23.
//

protocol FirebaseAuthService {
  // MARK: - Property
  var isUserLoggedIn: Bool { get }
  
  // MARK: - Method
  func signUp(
    email: String,
    password: String
  ) async throws
  
  func signIn(
    email: String,
    password: String
  ) async throws
  
  func signOut() throws
}
