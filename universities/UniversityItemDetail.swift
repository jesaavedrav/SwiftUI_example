//
//  UniversityItemDetail.swift
//  universities
//
//  Created by Diego Morales on 24/11/21.
//

import SwiftUI

struct UniversityItemDetail: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title).font(.system(size: 17, weight: .bold))
            Text(subtitle).padding(.bottom, 20).font(.system(size: 17, weight: .light))
        }
    }
}

struct UniversityItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        UniversityItemDetail(title: "Universidad", subtitle: "Titulo Universidad")
    }
}
