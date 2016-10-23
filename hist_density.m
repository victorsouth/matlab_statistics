function varargout = hist_density(x, bin_count)

n = length(x);
min_x = min(x);
max_x = max(x);

dx = (max_x - min_x) / bin_count;
[counts, centers] = hist(x, bin_count);
density = (counts / n) / dx;

if nargout == 0
    plot(centers, density);
else if nargout == 2
        varargout{1} = density;
        varargout{2} = centers;
    end
end


end




