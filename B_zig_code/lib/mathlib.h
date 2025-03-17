#ifndef MATHLIB_H
#define MATHLIB_H

#ifdef _WIN32
  #ifdef MATHLIB_EXPORTS
    #define MATHLIB_API __declspec(dllexport)
  #else
    #define MATHLIB_API __declspec(dllimport)
  #endif
#else
  #define MATHLIB_API
#endif

#ifdef __cplusplus
extern "C" {
#endif

MATHLIB_API int add(int a, int b);
MATHLIB_API int sub(int a, int b);

#ifdef __cplusplus
}
#endif

#endif // MATHLIB_H
