% Arguments:
%   data: vector or matrix to be plotted
%   t: character array, title of the chart

function f = plothist(data, t)
    hist(data);
    title(strcat(t, ': ', ...
        sprintf(' average = %4.1f, std.deviation = %4.1f, min = %4.0f, max = %4.0f', ...
        mean(data),std(data),min(data),max(data))));
end