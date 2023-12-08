//
//  FirebaseAuthError.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/8/23.
//

enum FirebaseAuthError {
  case networkError
  case emailAlreadyInUse
  case userNotFound
  case invalidEmail
  case weakPassword
  case wrongPassword
  case unknown
}

extension FirebaseAuthError: AppError {
  var errorDescription: String {
    switch self {
      case .networkError:
        return "네트워크 연결 문제가 발생했습니다. 네트워크 연결을 확인하고 다시 시도해주세요."
        
      case .emailAlreadyInUse:
        return "이미 사용중인 이메일입니다. 다른 이메일을 입력해주세요."
        
      case .userNotFound:
        return "입력하신 이메일 정보와 일치하는 계정을 찾을 수 없습니다."
        
      case .invalidEmail:
        return "이메일 형식이 올바르지 않습니다. 다시 입력해주세요."
        
      case .weakPassword:
        return "비밀번호의 보안 강도가 약합니다. 다시 입력해주세요."
        
      case .wrongPassword:
        return "잘못된 비밀번호를 입력했습니다. 다시 입력해주세요. 비밀번호를 잊으셨다면 비밀번호 찾기를 시도해주세요."
        
      case .unknown:
        return "정의되지 않은 오류입니다."
    }
  }
}

