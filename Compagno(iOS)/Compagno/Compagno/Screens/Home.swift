//
//  Home.swift
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
import SwiftUI

struct HomeView: View {
    @State private var presentGPA: String = ""
    @State private var remSem: String = ""
    @State private var target: String = ""
    
    @State private var showAlert = false
    @State private var resultMessage = ""
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                CustomTextField(placeholder: "Present GPA", text: $presentGPA)
                    .keyboardType(.decimalPad)
                
                CustomTextField(placeholder: "Remaining Semester(s)", text: $remSem)
                    .keyboardType(.numberPad)
                
                CustomTextField(placeholder: "Target CGPA", text: $target)
                    .keyboardType(.decimalPad)
                
                Button(action: handleSubmit) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top, 10)
                .alert("Result", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(resultMessage)
                }
            }
            .padding(30)
        }
    }
    
    private func handleSubmit() {
        guard let present = Double(presentGPA),
              let rem = Int32(remSem),
              let tgt = Double(target) else {
            resultMessage = "Please enter valid numeric values."
            showAlert = true
            return
        }
        
        // Call your C++ engine here
        let projected = GPAEngine_predict(present, rem, tgt)
        
        resultMessage = "With Present GPA \(present), \(rem) sems left, aiming for \(tgt), " +
                        "you need a semester GPA of: \(String(format: "%.2f", projected))"
        showAlert = true
    }
}

// MARK: - Reusable styled TextField
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            .autocorrectionDisabled(true)
    }
}

#Preview {
    HomeView()
}
