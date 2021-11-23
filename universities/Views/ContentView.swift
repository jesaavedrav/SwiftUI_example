//
//  ContentView.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import SwiftUI

struct ContentView: View {
   
   @ObservedObject var viewModel: UniversitiesViewModel = UniversitiesViewModel()
   
   init(){
      viewModel.callGetUniversities(country: "Ecuador")
   }
   
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
