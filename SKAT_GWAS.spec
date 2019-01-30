/*
A KBase module: SKAT_GWAS
*/

module SKAT_GWAS {
    typedef structure {
        string report_name;
        string report_ref;
    } ReportResults;

    /*
        This example function accepts any number of parameters and returns results in a KBaseReport
    */
    funcdef run_SKAT_GWAS(mapping<string,UnspecifiedObject> params) returns (ReportResults output) authentication required;

};
