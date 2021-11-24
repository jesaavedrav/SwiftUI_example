//
//  NetworkProvider.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation
import Combine



public final class NetworkProvider<Target: AppTargetType>: NSObject, URLSessionDelegate {
   public lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
   
   public func performRequest(_ target: Target) -> AnyPublisher<[UniversityDTO], Error> {
      let request = getRequest(target: target)
      //NetworkProvider.log(request: request)
      //let url = URL(string: "http://universities.hipolabs.com/search?country=Ecuador")!
      return session.dataTaskPublisher(for: request)
         .tryMap(){ element -> Data in
            NetworkProvider.log(response: element.response as? HTTPURLResponse, data: element.data, error: nil)

            guard let httpResponse = element.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                     throw URLError(.badServerResponse)
                  }
            return element.data
         }
         .decode(type: [UniversityDTO].self, decoder: JSONDecoder())
         .receive(on: DispatchQueue.main)
         .eraseToAnyPublisher()
   }
   
   
   private func getRequest(target: Target) -> URLRequest {
      let urlComponents: NSURLComponents = target.baseURL
      if(!(target.queryItems?.isEmpty ?? true)){
         urlComponents.queryItems = target.queryItems
      }
      var url: URL = urlComponents.url!
      url.appendPathComponent(target.path)
      var request = URLRequest(url: url)
      target.headers?.forEach({ header in
         request.setValue(header.value, forHTTPHeaderField: header.key)
      })
      request.httpMethod = target.method.rawValue
      request.httpBody = target.data
      return request
   }
   
   
   private static func log(request: URLRequest) {
      print("\n - - - - - - - - - - OUTGOING - - - - - - - - - - \n")
      defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
      let urlAsString = request.url?.absoluteString ?? ""
      let urlComponents = URLComponents(string: urlAsString)
      let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
      let path = "\(urlComponents?.path ?? "")"
      let query = "\(urlComponents?.query ?? "")"
      let host = "\(urlComponents?.host ?? "")"
      var output = """
      \(urlAsString) \n\n
      \(method) \(path)?\(query) HTTP/1.1 \n
      HOST: \(host)\n
      """
      for (key,value) in request.allHTTPHeaderFields ?? [:] {
         output += "\(key): \(value) \n"
      }
      if let body = request.httpBody {
         output += "\n \(String(data: body, encoding: .utf8) ?? "")"
      }
      print(output)
   }
   
   private static func log(response: HTTPURLResponse?, data: Data?, error: Error?) {
      print("\n - - - - - - - - - - INCOMMING - - - - - - - - - - \n")
      defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
      let urlString = response?.url?.absoluteString
      let components = NSURLComponents(string: urlString ?? "")
      let path = "\(components?.path ?? "")"
      let query = "\(components?.query ?? "")"
      var output = ""
      if let urlString = urlString {
         output += "\(urlString)"
         output += "\n\n"
      }
      if let statusCode =  response?.statusCode {
         output += "HTTP \(statusCode) \(path)?\(query)\n"
      }
      if let host = components?.host {
         output += "Host: \(host)\n"
      }
      for (key, value) in response?.allHeaderFields ?? [:] {
         output += "\(key): \(value)\n"
      }
      if let body = data {
         output += "\n\(String(data: body, encoding: .utf8) ?? "")\n"
      }
      if error != nil {
         output += "\nError: \(error!.localizedDescription)\n"
      }
      print(output)
   }
   
}
