//
//  Attendance.swift
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
import SwiftUI

struct AttendanceView: View {
    @State private var presentPercent: String = ""
    @State private var targetPercent: String = ""
    @State private var selectedMode = "Present"
    
    @State private var showAlert = false
    @State private var resultMessage = ""
    
    @FocusState private var isInputActive: Bool   // 👈 keyboard focus
    
    let modes = ["Present", "Absent"]
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                CustomTextField(placeholder: "Present Attendance (%)", text: $presentPercent)
                    .keyboardType(.decimalPad)
                    .focused($isInputActive)
                
                CustomTextField(placeholder: "Target Attendance (%)", text: $targetPercent)
                    .keyboardType(.decimalPad)
                    .focused($isInputActive)
                
                Picker("Mode", selection: $selectedMode) {
                    ForEach(modes, id: \.self) { mode in
                        Text(mode)
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
        guard let present = Double(presentPercent),
              let target = Double(targetPercent) else {
            resultMessage = "Please enter valid numeric values."
            showAlert = true
            return
        }
        
        let cMode = (selectedMode as NSString).utf8String
        let result = AttendanceEngine_compute(present, target, cMode)
        
        resultMessage = "Mode: \(selectedMode)\nDays needed: \(Int(result))"
        showAlert = true
    }
}

#Preview {
    AttendanceView()
}
