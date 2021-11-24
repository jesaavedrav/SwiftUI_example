//
//  ContentView.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    let options = ["first", "second", "third"]
    @State var navigateToSecond: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                List(){
                    ForEach((0..<options.count), id: \.self){
                        index in
                        ListItem(universityName: options[index], universityWebsite: "www", navigateToSecond: $navigateToSecond)
                    }
                }.navigationTitle("SwiftUI")
                    .navigationBarTitleDisplayMode(.inline)
                    .background(
                                        NavigationLink(
                                            destination: UniversityDetails(universityName: "USFQ", universityCountry: "Ecuador", universityCountryCode: "EC", universityWebsite: "www.usfq.edu.ec", universityDomain: "usfq.edu.ec"),
                                            isActive: $navigateToSecond,
                                            label: {
                                                EmptyView()
                                            })
                                            .hidden()
                                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
