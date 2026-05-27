function [Pop_P, FrontNo_P, CrowdDis_P, Pop_R, FrontNo_R, CrowdDis_R] = TwoStageEnvironmentalSelection(Pop_R, N)
% Environmental selection based on two-stage non-dominated sorting

%% First-stage non-dominated sorting based on constraint violation values
if isempty(Pop_R.cons)
    V = zeros(length(Pop_R),1);
else
    V = max(0,Pop_R.cons);
end
[FrontNo_v, MaxFNo_v] = NDSort(V, inf);

%% Second-stage non-dominated sorting based on objective function values
FrontNo_R    = zeros(1, length(Pop_R));
current_offset = 0;

for i = 1 : MaxFNo_v
    group = find(FrontNo_v == i);
    if ~isempty(group)
        [FrontNo_f, MaxFNo_f] = NDSort(Pop_R(group).objs, inf);
        for j = 1 : MaxFNo_f
            FrontNo_R(group(FrontNo_f == j)) = current_offset + j;
        end
        current_offset = current_offset + MaxFNo_f;
    end
end

%% Calculate the crowding distance
CrowdDis_R = CrowdingDistance(Pop_R.objs, FrontNo_R);

%% Select N solutions
sorted_fronts = sort(FrontNo_R);
MaxFNo        = sorted_fronts(N);

Next = FrontNo_R < MaxFNo;

Last = find(FrontNo_R == MaxFNo);
[~,Rank] = sort(CrowdDis_R(Last),'descend');

Next(Last(Rank(1:N-sum(Next)))) = true;

%% Return the selected parents and their corresponding selection information
Pop_P        = Pop_R(Next);
FrontNo_P    = FrontNo_R(Next);
CrowdDis_P   = CrowdDis_R(Next);
end