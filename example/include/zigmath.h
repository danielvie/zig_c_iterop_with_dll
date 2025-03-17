#ifndef ZIGMATH_H
#define ZIGMATH_H

#ifdef _WIN32
    #define ZIGMATH_API __declspec(dllimport)
#else
    #define ZIGMATH_API
#endif

ZIGMATH_API int mul(int a, int b);

#endif // ZIGMATH_H