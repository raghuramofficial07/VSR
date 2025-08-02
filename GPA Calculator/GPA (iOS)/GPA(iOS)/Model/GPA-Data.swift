// GPA_Data.swift

import Foundation

struct GPA_Data {
    
    var Result : Double?
    
    // Core GPA calculation method
    mutating func calculateRequiredGPA(presentGPA: Double, remainingSem: Int, targetGPA: Double) -> Double? {
        guard remainingSem > 0 else { return nil }

        let totalSem = remainingSem + 1
        let requiredTotalGPA = targetGPA * Double(totalSem)
        let achievedGPA = presentGPA * 1.0  // Assuming current GPA is from 1 semester
        let remainingGPA = requiredTotalGPA - achievedGPA
        let requiredEachSemGPA = remainingGPA / Double(remainingSem)
        
        Result = requiredEachSemGPA
        
        return requiredEachSemGPA
    }
}
