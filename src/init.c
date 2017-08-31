#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

SEXP rawmatch (SEXP needle, SEXP haystack);
static R_CallMethodDef callMethods[]  = {
  {"rawmatch", (DL_FUNC) &rawmatch, 2},
  {NULL, NULL, 0}
};

void R_init_mime(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, callMethods, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
