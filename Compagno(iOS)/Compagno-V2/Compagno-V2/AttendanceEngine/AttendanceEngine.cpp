//
//  AttendanceEngine.cpp
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
#include "AttendanceEngine.hpp"
#include <cmath>
#include <cstdlib> // for rand()
#include <cstring>

double AttendanceEngine_compute(double presentPercent, double targetPercent, const char* mode) {
    // Random classes per day between 1 and 5
    int classesPerDay = rand() % 5 + 1;

    double C = 100.0; // Total classes (example base)
    double PO = presentPercent;

    double result = 0.0;

    if (strcmp(mode, "Present") == 0) {
        // Attending extra classes
        double d = 1.0; // can adjust per day or make input
        double x = d * classesPerDay;
        result = ceil( ((targetPercent*C - PO*C) / (100 - targetPercent)) / classesPerDay );
    } else if (strcmp(mode, "Absent") == 0) {
        // Missed classes
        double d = 1.0;
        double y = d * classesPerDay;
        result = ceil( ((PO*C - targetPercent*C) / targetPercent) / classesPerDay );
    }

    return result;
}


