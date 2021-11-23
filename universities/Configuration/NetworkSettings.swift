//
//  NetworkSettings.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation

public struct NetworkSettings {
   /*
   private let httpProtocol: String
   private let baseURL: String
   
   public init(httpProtocol: String, baseURL: String) {
      self.httpProtocol = httpProtocol
      self.baseURL = baseURL
   }*/
   
   public func getURL() -> NSURLComponents {
      //return NSURLComponents(string: httpProtocol + "://" + baseURL)!
      return NSURLComponents(string: "http://universities.hipolabs.com/")!
   }
}

public struct ServerCertificate {
   public var name: String
   public var certExtension: String
}
