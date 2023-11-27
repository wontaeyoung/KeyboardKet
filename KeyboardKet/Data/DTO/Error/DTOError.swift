//
//  DTOError.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

enum DTOError: AppError {
  case mapToModelFailed
  
  var errorDescription: String {
    switch self {
      case .mapToModelFailed:
        return "클라이언트 데이터로 변경에 실패했습니다."
    }
  }
}
