function p = chisquare(observed, expected)
    %normal histogram was generated with following code:
    %normalHist = hist(sum(rand(3000,52).^2,2),52);
    Nvals = sum(observed);
    Nbins = length(observed);
    cs = sum((observed-expected).^2 ./ expected)
    p = cdf('Chisquare',cs,Nbins-1)
    
    if p < 0.01; disp('the chi square statistic is surprisingly small');end
    if p > 0.99; disp('the chi square statistic is surprisingly large');end
end