% This function will calculate the chi-square value for the two given
% histograms.
%
% Source: CS170A Course Notes - D.S. Parker, 2011

function p = chisquare(observed, expected)
    Nvals = sum(observed);
    Nbins = length(observed);
    cs = sum((observed-expected).^2 ./ expected)
    p = cdf('Chisquare',cs,Nbins-1)
    
    if p < 0.01; disp('the chi square statistic is surprisingly small');end
    if p > 0.99; disp('the chi square statistic is surprisingly large');end
end