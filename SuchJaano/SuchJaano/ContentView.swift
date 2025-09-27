//
//  ContentView.swift
//  SuchJaano
//
//  Created by RaghuRam on 26/09/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""
    @State private var isLoading = false
    @State private var showPassword = false
    @State private var isAuthenticated = false

    var body: some View {
        if isAuthenticated {
            HomeScreen()
        } else {
            loginView
        }
    }
    
    private var loginView: some View {
        ZStack {
            // Beautiful gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.15, blue: 0.25),
                    Color(red: 0.2, green: 0.25, blue: 0.35)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 40) {
                    Spacer(minLength: 60)
                    
                    // App Title with beautiful gradient
                    VStack(spacing: 10) {
                        Text("SuchJaano")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.orange, .yellow],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        
                        Text("#Har Bhartiya ki Awaaz Seedhi Aur Apni Hai")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    // Input Fields Section
                    VStack(spacing: 25) {
                        // Email TextField
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .foregroundColor(.white.opacity(0.9))
                                .font(.subheadline)
                                .fontWeight(.medium)
                            
                            TextField("Enter your email", text: $email)
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.1))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                        )
                                )
                                .foregroundColor(.white)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                        }
                        
                        // Password TextField
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .foregroundColor(.white.opacity(0.9))
                                .font(.subheadline)
                                .fontWeight(.medium)
                            
                            HStack {
                                if showPassword {
                                    TextField("Enter your password", text: $password)
                                        .foregroundColor(.white)
                                } else {
                                    SecureField("Enter your password", text: $password)
                                        .foregroundColor(.white)
                                }
                                
                                Button(action: {
                                    showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    // Sign In Button
                    Button(action: {
                        signInUser()
                    }) {
                        HStack {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .scaleEffect(0.8)
                            }
                            
                            Text(isLoading ? "Signing In..." : "Sign In")
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
                    .disabled(isLoading || email.isEmpty || password.isEmpty)
                    .opacity(isLoading || email.isEmpty || password.isEmpty ? 0.6 : 1.0)
                    .padding(.horizontal)
                    
                    // Sign Up Link
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.white.opacity(0.7))
                        
                        Button("Sign Up") {
                            signUpUser()
                        }
                        .foregroundColor(.orange)
                        .fontWeight(.semibold)
                    }
                    .font(.subheadline)
                    
                    // Message Display
                    if !message.isEmpty {
                        Text(message)
                            .foregroundColor(message.contains("successful") ? .green : .red)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white.opacity(0.1))
                            )
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 40)
                }
            }
        }
    }
    
    // MARK: - Authentication Functions
    private func signInUser() {
        guard isValidEmail(email) else {
            message = "Please enter a valid email address"
            return
        }
        
        guard password.count >= 6 else {
            message = "Password must be at least 6 characters"
            return
        }
        
        isLoading = true
        message = ""
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    message = error.localizedDescription
                } else {
                    message = "Sign in successful! Welcome back!"
                    isAuthenticated = true
                }
            }
        }
    }
    
    private func signUpUser() {
        guard isValidEmail(email) else {
            message = "Please enter a valid email address"
            return
        }
        
        guard password.count >= 6 else {
            message = "Password must be at least 6 characters"
            return
        }
        
        isLoading = true
        message = ""
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    message = error.localizedDescription
                } else {
                    message = "Account created successfully! Welcome to SuchJaano!"
                    isAuthenticated = true
                }
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

#Preview {
    ContentView()
}
