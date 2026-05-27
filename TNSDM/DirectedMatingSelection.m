function MatingPool = DirectedMatingSelection(Problem,Pop_P,FrontNo_P,CrowdDis_P,Pop_R,FrontNo_R,CrowdDis_R,MatingType)
% Directed mating with greedy selection or tournament selection

Pa_array = repmat(Pop_P(1),1,Problem.N);
Pb_array = repmat(Pop_P(1),1,Problem.N);

for i = 1 : Problem.N
    %% Select the primary parent pa from P by crowded tournament selection
    idx_pa = TournamentSelection(2,1,FrontNo_P,-CrowdDis_P);
    pa = Pop_P(idx_pa);

    %% Pick solutions in R that dominate pa in the objective space
    M_idx = find(all(Pop_R.objs <= pa.objs,2) & any(Pop_R.objs <  pa.objs,2));

    %% Directed mating
    if all(pa.cons <= 0) && numel(M_idx) >= 2
        switch MatingType
            case 1
                %% Greedy selection (GS)
                % Select the best solution in M according to the front number and crowding distance
                BestFront = min(FrontNo_R(M_idx));
                Candidate = M_idx(FrontNo_R(M_idx) == BestFront);

                [~,best] = max(CrowdDis_R(Candidate));
                pb = Pop_R(Candidate(best));

            case 2
                %% Tournament selection (TS)
                % Select the secondary parent pb from M by crowded tournament selection
                winner = TournamentSelection(2,1,FrontNo_R(M_idx),-CrowdDis_R(M_idx));
                pb = Pop_R(M_idx(winner));

            otherwise
                error('MatingType must be 1 (greedy selection) or 2 (tournament selection).');
        end
    else
        % Select the secondary parent pb from P if directed mating is not applied
        idx_pb = TournamentSelection(2,1,FrontNo_P,-CrowdDis_P);
        pb = Pop_P(idx_pb);
    end
    Pa_array(i) = pa;
    Pb_array(i) = pb;
end

%% Construct the mating pool for OperatorGAhalf
% The first half contains primary parents, and the second half contains secondary parents.
MatingPool = [Pa_array, Pb_array];
end