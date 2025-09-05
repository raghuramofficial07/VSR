//
//  GPAEngine.cpp
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
#include "GPAEngine.hpp"

double GPAEngine_calculate(const int scores[], int count) {
    if (count == 0) return 0.0;
    double sum = 0.0;
    for (int i = 0; i < count; i++) sum += scores[i];
    return sum / count / 25.0; // scale down to GPA (example)
}

double GPAEngine_predict(double presentGPA, int remSem, double target) {
    // Very simple logic:
    // Assume each remaining semester must average to hit target
    if (remSem <= 0) return target;
    
    // Weighted average logic
    // (present + rem*X) / (rem+1) = target
    double needed = ((target * (remSem + 1)) - presentGPA) / remSem;
    return needed;
}

