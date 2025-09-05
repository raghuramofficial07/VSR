//
//  CalcEngine.cpp
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
#include "CalcEngine.hpp"
#include <cmath>
#include <cstring>

double CalcEngine_compute(const char* mode, double value) {
    if (strcmp(mode, "log") == 0) return log(value);
    if (strcmp(mode, "sin") == 0) return sin(value);
    if (strcmp(mode, "cos") == 0) return cos(value);
    return 0;
}

