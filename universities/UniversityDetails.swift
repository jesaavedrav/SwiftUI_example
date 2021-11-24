//
//  UniversityDetails.swift
//  universities
//
//  Created by Diego Morales on 23/11/21.
//

import SwiftUI

struct UniversityDetails: View {
    let universityName: String
    let universityCountry: String
    let universityCountryCode: String
    let universityWebsite: String
    let universityDomain: String
    
    
    var body: some View {
            VStack(){
                Image(systemName: "building.columns") .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding().frame(
                        width: 110.0, height: 133.0, alignment: .center
                      )
                
                Text(universityName).font(.system(size: 28, weight: .light))
                
                VStack(alignment: .leading){
                    UniversityItemDetail(title: "Country", subtitle: universityCountry)
                    
                    UniversityItemDetail(title: "Country Code", subtitle: universityCountryCode)
                    
                    UniversityItemDetail(title: "Web Pages", subtitle: universityWebsite)
                    
                    UniversityItemDetail(title: "Domains", subtitle: universityDomain)
                    
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                  )
            }
            .navigationTitle("University Details")
                .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct UniversityDetails_Previews: PreviewProvider {
    static var previews: some View {
        UniversityDetails(universityName: "USFQ", universityCountry: "Ecuador", universityCountryCode: "EC", universityWebsite: "www.usfq.edu.ec", universityDomain: "usfq.edu.ec")
    }
}
