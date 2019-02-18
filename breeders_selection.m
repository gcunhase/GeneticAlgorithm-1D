function [next_parents] = breeders_selection(pop_sorted, best_sample,lucky_few)
%BREEDERS_SELECTION Selection method
%   Selects N best_samples and M lucky_few from the population to form the
%   next population. This method was chosen because elitism may cause the
%   algorithm to converge to a local minima.
%
%   Source: https://blog.sicara.com/getting-started-genetic-algorithms-python-tutorial-81ffa1dd72f9
%

    next_parents = pop_sorted(best_sample);
    next_parents = [next_parents, pop_sorted(lucky_few)];
    
    %Shuffle next population
    next_parents = next_parents(randperm(length(next_parents)));

end

