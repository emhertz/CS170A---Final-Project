% This function calculates the first digit of the given input argument x.

function f = firstdigit(x)
    f = floor(x ./ (10 .^ floor(log10(x))));
end