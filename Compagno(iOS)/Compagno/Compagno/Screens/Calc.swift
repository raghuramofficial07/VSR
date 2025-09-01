//
//  Calc.swift
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
import SwiftUI

struct CalcView: View {
    @State private var inputValue: String = ""
    @State private var selectedMode = "log"
    
    @State private var showAlert = false
    @State private var resultMessage = ""
    
    let modes = ["log", "sin", "cos"]
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                CustomTextField(placeholder: "Enter Value", text: $inputValue)
                    .keyboardType(.decimalPad)
                
                Picker("Mode", selection: $selectedMode) {
                    ForEach(modes, id: \.self) { mode in
                        Text(mode.uppercased())
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button(action: handleSubmit) {
                    Text("Calculate")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
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
        guard let value = Double(inputValue) else {
            resultMessage = "Please enter a valid number."
            showAlert = true
            return
        }
        
        // Call C++ function
        let result = CalcEngine_compute(selectedMode, value)
        
        resultMessage = "Mode: \(selectedMode.uppercased())\nInput: \(value)\nResult: \(String(format: "%.4f", result))"
        showAlert = true
    }
}


#Preview {
    CalcView()
}

