// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// evenFibonacci
double evenFibonacci(double position, double limit, double total);
RcppExport SEXP _projectEuler_evenFibonacci(SEXP positionSEXP, SEXP limitSEXP, SEXP totalSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type position(positionSEXP);
    Rcpp::traits::input_parameter< double >::type limit(limitSEXP);
    Rcpp::traits::input_parameter< double >::type total(totalSEXP);
    rcpp_result_gen = Rcpp::wrap(evenFibonacci(position, limit, total));
    return rcpp_result_gen;
END_RCPP
}
// largestFactorial
String largestFactorial(int element);
RcppExport SEXP _projectEuler_largestFactorial(SEXP elementSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type element(elementSEXP);
    rcpp_result_gen = Rcpp::wrap(largestFactorial(element));
    return rcpp_result_gen;
END_RCPP
}
// problem23Cpp
double problem23Cpp();
RcppExport SEXP _projectEuler_problem23Cpp() {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    rcpp_result_gen = Rcpp::wrap(problem23Cpp());
    return rcpp_result_gen;
END_RCPP
}
// maxPalindrome
double maxPalindrome(const double old, const double from, const double limit);
RcppExport SEXP _projectEuler_maxPalindrome(SEXP oldSEXP, SEXP fromSEXP, SEXP limitSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const double >::type old(oldSEXP);
    Rcpp::traits::input_parameter< const double >::type from(fromSEXP);
    Rcpp::traits::input_parameter< const double >::type limit(limitSEXP);
    rcpp_result_gen = Rcpp::wrap(maxPalindrome(old, from, limit));
    return rcpp_result_gen;
END_RCPP
}
// greatestProduct
double greatestProduct(NumericVector numbers, const double digits);
RcppExport SEXP _projectEuler_greatestProduct(SEXP numbersSEXP, SEXP digitsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type numbers(numbersSEXP);
    Rcpp::traits::input_parameter< const double >::type digits(digitsSEXP);
    rcpp_result_gen = Rcpp::wrap(greatestProduct(numbers, digits));
    return rcpp_result_gen;
END_RCPP
}
// erastosthenesSieve
NumericVector erastosthenesSieve(const double limit);
RcppExport SEXP _projectEuler_erastosthenesSieve(SEXP limitSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const double >::type limit(limitSEXP);
    rcpp_result_gen = Rcpp::wrap(erastosthenesSieve(limit));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_projectEuler_evenFibonacci", (DL_FUNC) &_projectEuler_evenFibonacci, 3},
    {"_projectEuler_largestFactorial", (DL_FUNC) &_projectEuler_largestFactorial, 1},
    {"_projectEuler_problem23Cpp", (DL_FUNC) &_projectEuler_problem23Cpp, 0},
    {"_projectEuler_maxPalindrome", (DL_FUNC) &_projectEuler_maxPalindrome, 3},
    {"_projectEuler_greatestProduct", (DL_FUNC) &_projectEuler_greatestProduct, 2},
    {"_projectEuler_erastosthenesSieve", (DL_FUNC) &_projectEuler_erastosthenesSieve, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_projectEuler(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
