//
//  AppTargetType.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation

public protocol AppTargetType {
   
   var baseURL: NSURLComponents { get }
   
   var path: String { get }
   
   var method: HTTPMethod { get }
   
   var task: HTTPTask { get }
   
   var headers: [String: String]? { get }
   
   var data: Data? { get }
   
   var queryItems: [URLQueryItem]? { get }
   
}

public enum HTTPMethod: String {
   case get = "GET"
   case post = "POST"
   case put = "PUT"
}

public enum HTTPTask {
   case dataTask
}
