//
//  ContentView.swift
//  universities
//
//  Created by Jorge Saavedra on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    let options = ["first", "second", "third"]
    
    var body: some View {
        List(){
            ForEach((0..<options.count), id: \.self){
                index in
                ListItem(universityName: options[index], universityWebsite: "www")
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
