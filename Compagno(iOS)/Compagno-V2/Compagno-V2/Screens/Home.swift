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
    
    @FocusState private var isInputActive: Bool   // 👈 keyboard focus
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                CustomTextField(placeholder: "Present GPA", text: $presentGPA)
                    .keyboardType(.decimalPad)
                    .focused($isInputActive)
                
                CustomTextField(placeholder: "Remaining Semester(s)", text: $remSem)
                    .keyboardType(.numberPad)
                    .focused($isInputActive)
                
                CustomTextField(placeholder: "Target CGPA", text: $target)
                    .keyboardType(.decimalPad)
                    .focused($isInputActive)
                
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
                    Button("OK", role: .cancel) {
                        isInputActive = false   // 👈 hide keyboard
                    }
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
        TextField(
            "", // empty label, because we use `prompt` instead
            text: $text,
            prompt: Text(placeholder)
                .foregroundColor(.gray) // custom color
        )
        .padding()
        .background(Color("TextColor"))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .autocorrectionDisabled(true)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}


#Preview {
    HomeView()
}
