//
//  Resources.swift
//  CovidSymptomTracking
//
//  Created by Soumya Duriseti on 2/14/21.
//

import Foundation
import SwiftUI

struct Resources: View{
    var body: some View {
        VStack{
            Text("Resources")
                .font(.largeTitle)
            Link("Health Information on Covid", destination: URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/index.html")!)
            Link("Education Resources for Covid", destination: URL(string: "https://www.ed.gov/coronavirus/")!)
            Link("Food Resources for Covid", destination: URL(string: "https://www.nimh.nih.gov/health/education-awareness/shareable-resources-on-coping-with-covid-19.shtml")!)
            Link("Mental Health Resource for Covid", destination: URL(string: "https://www.fns.usda.gov/disaster/pandemic/covid-19/resources-individuals-families")!)
            
            Text("Hospital Capacity at Your Location San Francisco")
                .font(.largeTitle)
            Image("NYT2")
               .resizable()
               .aspectRatio(contentMode: .fit)
               //.frame(width: 250.0, height: 250.0, alignment: .center)
               .border(Color.blue, width: 3.0)
               .clipped()
        }
        .padding()
        .background(Color(red: 193, green: 165, blue: 188))
    }
}
struct Resources_Previews: PreviewProvider {
    static var previews: some View {
        Resources()
    }
}
