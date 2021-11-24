//
//  UniversityService.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation
import Combine

public struct UniversityService {
   
   public var provider: NetworkProvider<UniversitiesProvider> = NetworkProvider<UniversitiesProvider>()
   
   public func search(items: [URLQueryItem]) -> AnyPublisher<[UniversityDTO], Error> {
      return provider.performRequest(.search(items: items))
         //.map(\.value)
         .eraseToAnyPublisher()
   }
   
}
