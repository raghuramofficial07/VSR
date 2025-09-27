//
//  HomeTabView.swift
//  SuchJaano
//
//  Created by RaghuRam on 27/09/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

// MARK: - Post Model
struct ThoughtPost: Identifiable {
    let id: String
    let userId: String
    let userEmail: String
    let text: String
    let timestamp: Date
    let likes: Int
    
    init(id: String, data: [String: Any]) {
        self.id = id
        self.userId = data["userId"] as? String ?? ""
        self.userEmail = data["userEmail"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.likes = data["likes"] as? Int ?? 0
        
        if let timestamp = data["timestamp"] as? Timestamp {
            self.timestamp = timestamp.dateValue()
        } else {
            self.timestamp = Date()
        }
    }
}

// MARK: - Home Tab
struct HomeTabView: View {
    @State private var posts: [ThoughtPost] = []
    @State private var isLoading = true
    @State private var userEmail = ""
    private let db = Firestore.firestore()
    
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
                    VStack(spacing: 20) {
                        // Welcome Header
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Welcome back!")
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor(.secondary)
                                    
                                    Text("SuchJaano Feed")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                }
                                
                                Spacer()
                                
                                // Refresh button
                                Button(action: {
                                    loadPosts()
                                }) {
                                    Image(systemName: "arrow.clockwise")
                                        .font(.title2)
                                        .foregroundColor(.orange)
                                }
                            }
                            .padding()
                        }
                        
                        // User Welcome Card
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [.orange, .red],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .frame(width: 50, height: 50)
                                    
                                    Text(userEmail.prefix(1).uppercased())
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Hello, \(userEmail.components(separatedBy: "@").first ?? "User")!")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    
                                    Text("What would you like to share today?")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(16)
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        
                        // Posts Section
                        if isLoading {
                            VStack(spacing: 20) {
                                ProgressView()
                                    .scaleEffect(1.2)
                                
                                Text("Loading thoughts...")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(40)
                        } else if posts.isEmpty {
                            VStack(spacing: 15) {
                                Image(systemName: "bubble.left.and.bubble.right")
                                    .font(.system(size: 50))
                                    .foregroundColor(.orange)
                                
                                Text("No thoughts yet")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                
                                Text("Be the first to share your thoughts with the community!")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(40)
                        } else {
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Recent Thoughts")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal)
                                
                                LazyVStack(spacing: 15) {
                                    ForEach(posts) { post in
                                        PostCard(post: post)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        Spacer(minLength: 20)
                    }
                }
                .refreshable {
                    loadPosts()
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                loadUserInfo()
                loadPosts()
            }
        }
    }
    
    // MARK: - Helper Functions
    private func loadUserInfo() {
        if let user = Auth.auth().currentUser {
            userEmail = user.email ?? "Unknown User"
        }
    }
    
    private func loadPosts() {
        isLoading = true
        
        db.collection("thoughts")
            .order(by: "timestamp", descending: true)
            .limit(to: 20)
            .getDocuments { snapshot, error in
                DispatchQueue.main.async {
                    isLoading = false
                    
                    if let error = error {
                        print("Error loading posts: \(error)")
                        return
                    }
                    
                    guard let documents = snapshot?.documents else {
                        posts = []
                        return
                    }
                    
                    posts = documents.map { doc in
                        ThoughtPost(id: doc.documentID, data: doc.data())
                    }
                }
            }
    }
}

// MARK: - Post Card Component
struct PostCard: View {
    let post: ThoughtPost
    @State private var isLiked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // User Info
            HStack {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 35, height: 35)
                    
                    Text(post.userEmail.prefix(1).uppercased())
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(post.userEmail.components(separatedBy: "@").first ?? "User")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text(timeAgoString(from: post.timestamp))
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            // Post Content
            Text(post.text)
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            // Action Buttons
            HStack(spacing: 20) {
                Button(action: {
                    isLiked.toggle()
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .secondary)
                        
                        Text("\(post.likes + (isLiked ? 1 : 0))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Button(action: {
                    // Handle comment action
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "bubble.right")
                            .foregroundColor(.secondary)
                        
                        Text("Comment")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    // Helper function to format time
    private func timeAgoString(from date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
