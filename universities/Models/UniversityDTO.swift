//
//  UniversityDTO.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation


open class UniversityDTO: Decodable  {
   
   private var stateProvince: String?
   private var country: String?
   private var webPages: [String]?
   public var name: String?
   public var alphaTwoCode: String?
   public var domains: [String]?
   
   private enum CodingKeys : String, CodingKey {
      case stateProvince = "state-province"
      case country
      case webPages = "web_pages"
      case name
      case alphaTwoCode = "alpha_two code"
      case domains
   }
   
   open func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(stateProvince, forKey: .stateProvince)
      try container.encode(country, forKey: .country)
      try container.encode(webPages, forKey: .webPages)
      try container.encode(name, forKey: .name)
      try container.encode(alphaTwoCode, forKey: .alphaTwoCode)
      try container.encode(domains, forKey: .domains)
   }
}

