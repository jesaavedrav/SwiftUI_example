//
//  CoreApp.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation
public final class CoreApp {
   
   public static let shared = CoreApp()
   
   public var settings: NetworkSettings!
   
   private init() {}
   
   public func configure(settings: NetworkSettings) {
      self.settings = settings
   }
}
