//
//  HomeScreen.swift
//  SuchJaano
//
//  Created by RaghuRam on 27/09/25.
//

import SwiftUI
import FirebaseAuth

struct HomeScreen: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Home Tab
            HomeTabView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            // Post Tab
            PostTabView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Post")
                }
                .tag(1)
            
            // Settings Tab
            SettingsTabView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(2)
        }
        .accentColor(.orange)
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

