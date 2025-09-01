//
//  GPAEngine.hpp
//  Compagno
//
//  Created by RaghuRam on 01/09/25.
//
#ifdef __cplusplus
extern "C" {
#endif

double GPAEngine_calculate(const int scores[], int count);

// New function for prediction
double GPAEngine_predict(double presentGPA, int remSem, double target);

#ifdef __cplusplus
}
#endif
