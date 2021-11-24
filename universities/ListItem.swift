//
//  ListItem.swift
//  universities
//
//  Created by Diego Morales on 23/11/21.
//

import SwiftUI

struct ListItem: View {
    let universityName: String
    let universityWebsite: String
    @Binding var navigateToSecond: Bool
    
    var body: some View {
        Button(action: {
            print(universityName)
            navigateToSecond = true
        }){
            VStack(alignment: .leading){
                Text(universityName).padding(.bottom, 15)
                    .font(.system(size: 15, weight: .bold))
                
                Text("Website: " + universityWebsite).font(.system(size: 14))
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .topLeading
          )
            .buttonStyle(PlainButtonStyle())
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(universityName: "Universidad San Francisco de Quito", universityWebsite: "www.usfq.edu.ec", navigateToSecond: .constant(false))
    }
}
