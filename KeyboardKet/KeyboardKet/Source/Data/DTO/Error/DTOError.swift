//
//  DTOError.swift
//  KeyboardKet
//
//  Created by 원태영 on 11/23/23.
//

enum DTOError: AppError {
  case mapToModelFailed
  case mapToDTOFailed
  
  var errorDescription: String {
    switch self {
      case .mapToModelFailed:
        return "클라이언트 데이터로 변경에 실패했습니다."
        
      case .mapToDTOFailed:
        return "전송 데이터 변경에 실패했습니다."
    }
  }
}
