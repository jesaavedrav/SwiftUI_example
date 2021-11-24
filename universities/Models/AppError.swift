//
//  AppError.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation

public enum AppError: Error {
   case custom(description: String?)
   case pairGenerationFail(message: String)
   case publicKeyNotFound(message: String)
   case addKeyFailed(message: String)
   case deleteKeyFailed(message: String)
   case keyCreationFailed(message: String)
   case identityNotFound(message: String)
   case unknown
}

public extension AppError {
   var errorDescription: String {
      switch self {
      case .custom(let description): return description ?? "General Error"
      default: return "General Error"
      }
   }
}
