function plotData(x, y)
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

plot(x, y, 'rx', 'MarkerSize', 10); % Plot the data
xlabel('Population of City in 10,000s'); % Set the x􀀀axis label
ylabel('Profit in $10,000s'); % Set the y􀀀axis label
axis([4, 24, -5, 25]);

end
