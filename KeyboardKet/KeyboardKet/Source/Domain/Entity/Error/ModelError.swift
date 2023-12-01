//
//  ModelError.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

enum ModelError: AppError {
  case mapToDTOFailed
  
  var errorDescription: String {
    switch self {
      case .mapToDTOFailed:
        return "서버 데이터로 변경에 실패했습니다."
    }
  }
}
