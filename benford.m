function f = benford(data, t)
    f = zeros(1,length(data));
    for i=1:length(data)
        f(i) = firstdigit(data(i));
    end
    hist(f);
    title(strcat('Benford Histogram: ', ' ', t));
end