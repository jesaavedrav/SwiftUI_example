//
//  UniversitiesListView.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import SwiftUI

struct UniversitiesListView: View {
   
   @ObservedObject var viewModel: UniversitiesViewModel = UniversitiesViewModel()
   
   init(){
      viewModel.callGetUniversities(country: "Ecuador")
   }
   
   var body: some View {
      List(){
         ForEach((0..<viewModel.universities.count), id: \.self){
            index in
            ListItem(universityName: viewModel.universities[index].name ?? "", universityWebsite: viewModel.universities[index].domains?[0] ?? "")
         }
      }
   }
}

struct UniversitiesListView_Previews: PreviewProvider {
   static var previews: some View {
      UniversitiesListView()
   }
}
