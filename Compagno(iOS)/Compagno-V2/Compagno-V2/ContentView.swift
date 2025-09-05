//
//  ContentView.swift
//  Compagno
//
//  Created by RaghuRam on 31/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            NavigationView {
                HomeView()
                    .navigationTitle("GPA Calculator")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationView {
                CalcView()
                    .navigationTitle("Calculator")
            }
            .tabItem {
                Label("Calc", systemImage: "function")
            }
            
            NavigationView {
                AttendanceView()
                    .navigationTitle("Attendance")
            }
            .tabItem {
                Label("Attendance", systemImage: "calendar")
            }
        }
    }
}

#Preview {
    ContentView()
}


