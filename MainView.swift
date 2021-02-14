//
//  MainView.swift
//  CovidSymptomTracking
//
//  Created by Soumya Duriseti on 2/14/21.
//

import Foundation
import SwiftUI
struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Log", systemImage: "list.dash")
                }

            UserInfo()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
