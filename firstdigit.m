function f = firstdigit(x)
    f = floor(x ./ (10 .^ floor(log10(x))));
end