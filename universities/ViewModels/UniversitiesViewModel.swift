//
//  UniversitiesViewModel.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import Foundation

public class UniversitiesViewModel: ObservableObject {
   @Published var universities: [UniversityDTO] = []
   @Published public var errorMessage: String = ""
   @Published public var isBusy = false
   public lazy var cancelBag: CancelBag = CancelBag()
   
   private lazy var universitiesService: UniversityService = UniversityService()
   
   public func callGetUniversities(country: String) {
      self.isBusy = true
      let queryItems = [URLQueryItem(name: "country", value: country)]
      universitiesService.search(items: queryItems)
         .sink(receiveCompletion: { [weak self] completion in
            self?.isBusy = false
            switch completion {
            case .failure(let error):
               self?.errorMessage = error.localizedDescription
            case .finished:
               break
            }
         }, receiveValue: { [weak self] response in
            self?.isBusy = false
            self?.universities = response
            
         })
         .cancel(with: cancelBag)
   }
   
}
