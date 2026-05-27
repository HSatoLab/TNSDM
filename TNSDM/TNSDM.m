classdef TNSDM < ALGORITHM
    % <2013> <multi> <real/integer/label/binary/permutation> <constrained/none>
    % Two-stage non-dominated sorting and directed mating (TNSDM)
    % MatingType --- 2 --- Type of directed mating (1. Greedy Selection 2. Tournament Selection)

    %------------------------------- Reference --------------------------------
    % M. Miyakawa, K. Takadama, and H. Sato. Two-stage non-dominated sorting
    % and directed mating for solving problems with multi-objectives and
    % constraints. Proceedings of the Genetic and Evolutionary Computation
    % Conference, 2013, 647-654.
    % https://doi.org/10.1145/2463372.2463449
    %------------------------------- Copyright --------------------------------
    % Copyright (c) 2026 BIMK Group. You are free to use the PlatEMO for
    % research purposes. All publications which use this platform or any code
    % in the platform should acknowledge the use of "PlatEMO" and reference "Ye
    % Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
    % for evolutionary multi-objective optimization [educational forum], IEEE
    % Computational Intelligence Magazine, 2017, 12(4): 73-87".
    %--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            % Pop_P : Parents population P
            % Pop_Q : Offspring population Q
            % Pop_R : Entire population R = P \cup Q
            % FrontNo_P, CrowdDis_P : Front numbers and crowding distances of P
            % FrontNo_R, CrowdDis_R : Front numbers and crowding distances of R
            %
            % MatingType = 1 : Directed mating with greedy selection (GS)
            % MatingType = 2 : Directed mating with tournament selection (TS)

            %% Parameter setting
            MatingType = Algorithm.ParameterSet(2);

            %% Generate random population
            Pop_P = Problem.Initialization();
            [Pop_P,FrontNo_P,CrowdDis_P,Pop_R,FrontNo_R,CrowdDis_R] = TwoStageEnvironmentalSelection(Pop_P,Problem.N);

            %% Optimization
            while Algorithm.NotTerminated(Pop_P)
                MatingPool = DirectedMatingSelection(Problem,Pop_P,FrontNo_P,CrowdDis_P,Pop_R,FrontNo_R,CrowdDis_R,MatingType);
                Pop_Q  = OperatorGAhalf(Problem,MatingPool);
                [Pop_P,FrontNo_P,CrowdDis_P,Pop_R,FrontNo_R,CrowdDis_R] = TwoStageEnvironmentalSelection([Pop_P,Pop_Q],Problem.N);
            end
        end
    end
end