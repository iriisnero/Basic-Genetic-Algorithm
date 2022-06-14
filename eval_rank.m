% function rank = eval_rank(fitness, goal)
% 적응도를 입력받아 순위를 출력하는 함수
% 입력은 fitness(eval_fitness 에서 구한 적응도)
% 출력은 rank 배열

function rank = eval_rank(fitness);

goal = [11 8 3];
% 목표치는 11, 8, 3 [억]
sub_fitness = [];
% sum_fitness 는 목표치와 상속액의 차이
sum_fitness = zeros(4,1);
% sum_fitness 는 목표치와 상속액의 차이의 합
sum_fitness_t = [];
% sum_fitness_t 는 sum_fitness 의 전치행렬

for i = 1:4 % i는 fitness 의 행
    for j = 1:3 % j 는 fitness, goal 의 열
        sub_fitness(i,j) = abs( goal(j) - fitness(i,j) );
    end
end
% 목표치와 상속액의 차이를 구해 sub_fitness에 저장

for k = 1:4
    sum_fitness(k,1) = sum( sub_fitness(k,:) );
end
% sub_fitness 에서 각 유전자의 차이의 합을 구함

sum_fitness_t = sum_fitness';
% 순위를 정하기 위해 열벡터를 행벡터로 전환

[~,p] = sort(sum_fitness_t, 'ascend');
r = 1:length(sum_fitness_t);
r(p) = r;
rank = r;
rank;
% 최종 순위 출력

end