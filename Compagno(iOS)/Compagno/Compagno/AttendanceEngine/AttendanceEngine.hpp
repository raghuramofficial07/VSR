//
//  AttendanceEngine.hpp
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif

double AttendanceEngine_compute(double presentPercent, double targetPercent, const char* mode);

#ifdef __cplusplus
}
#endif

