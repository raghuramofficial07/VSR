//
//  PostTabView.swift
//  SuchJaano
//
//  Created by RaghuRam on 27/09/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

// MARK: - Post Tab
struct PostTabView: View {
    @State private var thoughtText = ""
    @State private var isPosting = false
    @State private var message = ""
    @State private var characterCount = 0
    private let maxCharacters = 280
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
                    VStack(spacing: 25) {
                        // Header
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Share Your Thoughts")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Text("\(characterCount)/\(maxCharacters)")
                                    .font(.caption)
                                    .foregroundColor(characterCount > maxCharacters ? .red : .secondary)
                            }
                            
                            Text("Express yourself and connect with others")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        // Text Input Area
                        VStack(alignment: .leading, spacing: 15) {
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(.systemBackground))
                                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                                    .frame(minHeight: 150)
                                
                                if thoughtText.isEmpty {
                                    Text("What's on your mind? Share your thoughts, experiences, or something you learned today...")
                                        .foregroundColor(.secondary)
                                        .padding()
                                        .allowsHitTesting(false)
                                }
                                
                                TextEditor(text: $thoughtText)
                                    .padding()
                                    .background(Color.clear)
                                    .scrollContentBackground(.hidden)
                                    .onChange(of: thoughtText) { newValue in
                                        characterCount = newValue.count
                                    }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Post Button
                        Button(action: {
                            postThought()
                        }) {
                            HStack {
                                if isPosting {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        .scaleEffect(0.8)
                                }
                                
                                Text(isPosting ? "Posting..." : "Share Thought")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(
                                LinearGradient(
                                    colors: [.orange, .red],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: .orange.opacity(0.3), radius: 8, x: 0, y: 4)
                        }
                        .disabled(isPosting || thoughtText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || characterCount > maxCharacters)
                        .opacity(isPosting || thoughtText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || characterCount > maxCharacters ? 0.6 : 1.0)
                        .padding(.horizontal)
                        
                        // Message Display
                        if !message.isEmpty {
                            Text(message)
                                .foregroundColor(message.contains("successfully") ? .green : .red)
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(.systemGray6))
                                )
                                .padding(.horizontal)
                        }
                        
                        // Quick Tips
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Tips for Great Posts")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            VStack(spacing: 8) {
                                TipRow(icon: "lightbulb", text: "Share something you learned today")
                                TipRow(icon: "heart", text: "Be positive and encouraging")
                                TipRow(icon: "person.2", text: "Connect with the community")
                                TipRow(icon: "text.quote", text: "Keep it authentic and genuine")
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top)
                        
                        Spacer(minLength: 50)
                    }
                }
            }
            .navigationTitle("Post")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Post Function
    private func postThought() {
        guard let user = Auth.auth().currentUser else {
            message = "Please log in to post"
            return
        }
        
        let trimmedText = thoughtText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else {
            message = "Please enter some text"
            return
        }
        
        guard trimmedText.count <= maxCharacters else {
            message = "Post is too long. Maximum \(maxCharacters) characters allowed."
            return
        }
        
        isPosting = true
        message = ""
        
        let postData: [String: Any] = [
            "userId": user.uid,
            "userEmail": user.email ?? "",
            "text": trimmedText,
            "timestamp": FieldValue.serverTimestamp(),
            "likes": 0,
            "comments": []
        ]
        
        db.collection("thoughts").addDocument(data: postData) { error in
            DispatchQueue.main.async {
                isPosting = false
                
                if let error = error {
                    message = "Failed to post: \(error.localizedDescription)"
                } else {
                    message = "Thought posted successfully!"
                    thoughtText = ""
                    characterCount = 0
                    
                    // Clear success message after 3 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        message = ""
                    }
                }
            }
        }
    }
}

// MARK: - Tip Row Component
struct TipRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(.orange)
                .frame(width: 20)
            
            Text(text)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}
