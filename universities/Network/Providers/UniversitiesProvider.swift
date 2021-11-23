//
//  UniversitiesProvider.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation


public enum UniversitiesProvider {
   case search(items: [URLQueryItem])
}

extension UniversitiesProvider: AppTargetType {
   
   public var baseURL: NSURLComponents {
      return NSURLComponents(string: "http://universities.hipolabs.com/")!
   }
   
   public var path: String {
      switch self {
      case .search:
         return "search"
      }
   }
   
   public var method: HTTPMethod {
      switch self {
      case .search:
         return .get
      }
   }
   
   public var task: HTTPTask {
      switch self {
      case .search:
         return .dataTask
      }
   }
   
   public var headers: [String : String]? {
      switch self {
      case .search:
         return [:]
      }
   }
   
   public var data: Data? {
      switch self {
      case .search:
         return nil
      }
   }
   
   public var queryItems: [URLQueryItem]? {
      switch self {
      case .search(let items):
         return items.map {$0 as URLQueryItem}
      }
   }
}
