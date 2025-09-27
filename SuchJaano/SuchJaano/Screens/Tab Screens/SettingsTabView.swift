//
//  SettingsTabView.swift
//  SuchJaano
//
//  Created by RaghuRam on 27/09/25.
//

import SwiftUI
import FirebaseAuth

// MARK: - Settings Tab
struct SettingsTabView: View {
    @State private var showSignOutAlert = false
    @State private var userEmail = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [Color(.systemBackground), Color(.systemGray6)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 25) {
                        // User Profile Section
                        VStack(spacing: 15) {
                            // Profile Picture Placeholder
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [.orange, .red],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 80, height: 80)
                                
                                Text(userEmail.prefix(1).uppercased())
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                            Text(userEmail)
                                .font(.headline)
                                .fontWeight(.medium)
                            
                            Text("SuchJaano Member")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top)
                        
                        // Settings Options
                        VStack(spacing: 0) {
                            SettingsRow(icon: "person.circle", title: "Profile", subtitle: "Manage your profile")
                            SettingsRow(icon: "bell", title: "Notifications", subtitle: "Manage notifications")
                            SettingsRow(icon: "lock.shield", title: "Privacy", subtitle: "Privacy settings")
                            SettingsRow(icon: "questionmark.circle", title: "Help & Support", subtitle: "Get help")
                            SettingsRow(icon: "info.circle", title: "About", subtitle: "App information")
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        
                        // App Info
                        VStack(spacing: 10) {
                            Text("SuchJaano")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("#Har Bhartiya ki Awaaz Seedhi Aur Apni Hai")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            
                            Text("Version 1.0.0")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        
                        // Sign Out Button
                        Button(action: {
                            showSignOutAlert = true
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .font(.headline)
                                
                                Text("Sign Out")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: .red.opacity(0.3), radius: 8, x: 0, y: 4)
                        }
                        .padding(.horizontal)
                        
                        Spacer(minLength: 50)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                loadUserInfo()
            }
            .alert("Sign Out", isPresented: $showSignOutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Sign Out", role: .destructive) {
                    signOutUser()
                }
            } message: {
                Text("Are you sure you want to sign out?")
            }
        }
    }
    
    // MARK: - Helper Functions
    private func loadUserInfo() {
        if let user = Auth.auth().currentUser {
            userEmail = user.email ?? "Unknown User"
        }
    }
    
    private func signOutUser() {
        do {
            try Auth.auth().signOut()
            // Note: In a complete implementation, you'd need to notify the parent view
            // to update the authentication state. This could be done through:
            // 1. A binding passed down from ContentView
            // 2. An ObservableObject for authentication state
            // 3. NotificationCenter
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

// MARK: - Settings Row Component
struct SettingsRow: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        Button(action: {
            // Handle settings option tap
        }) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.orange)
                    .frame(width: 25)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
