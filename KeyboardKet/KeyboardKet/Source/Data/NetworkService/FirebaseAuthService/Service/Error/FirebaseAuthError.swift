//
//  FirebaseAuthError.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/8/23.
//

enum FirebaseAuthError {
  case networkError
  case unknown
}

extension FirebaseAuthError: AppError {
  var errorDescription: String {
    switch self {
      case .networkError:
        return "네트워크 연결 문제가 발생했습니다. 네트워크 연결을 확인하고 다시 시도해주세요."
        
      case .unknown:
        return "정의되지 않은 오류입니다."
    }
  }
}

