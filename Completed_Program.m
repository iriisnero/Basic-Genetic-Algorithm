% GA algorithm assignment
% Three siblings A, B, C are going to distribute their parents
% money which is 2.1billion in ratio of 4:3:1 
% Eventually the goal is the give 11, 8, 3 billion respectively to A, B, C

clear all; clc;
% Clear everything

A = 1; B = 2; C = 3;
% Substitue A, B, C to 1, 2, 3

G1 = [B B A C B C];
G2 = [B B C C B B];
G3 = [A C B A A C];
G4 = [C B A B A A];
% 초기집단이 되는 4개의 유전자 생성
G_sum1 = [G1; G2; G3; G4]
% G_sum 은 4개의 유전자를 합친 행렬
goal = [11 8 3];
% A,B,C가 받아야 할 목표치로 각각 11억, 8억 3억
M1 = [0 1 1 1 1 1];
M2 = [0 0 0 1 1 1];
% 문제에서 주어진 마스크 패턴
% 적응도 평가 1위와 3위는 M1 사용
% 적응도 평가 2위와 4위는 M2 사용

G_sum1_fit = eval_fitness(G_sum1)
% 유전자 4개를 적응도 평가 함수인 eval_fitness 에 입력
% 출력은 [A B C] 로 나오며 A, B, C 가 각각 받는 상속액의 총합
% 예를 들어 a는 G1을 입력했을 때 A, B, C가 받는 상속액의 총합

G_sum1_rank = eval_rank(G_sum1_fit)
% 적응도의 순위를 정하기 위해 G_sum_fit1 를 eval_rank 에 입력
% 출력은 [G1 G2 G3 G4]의 적응도 순위로 나옴

G_sum1_elite = keep_elite(G_sum1,G_sum1_rank)
% 적응도 평가 후 4위를 1위의 값으로 바꾸는 엘리트 보존 선택법
% 유전자 4개와 순위를 입력
% 출력은 엘리트 보존된 4x4 행렬

G_sum1_cross = cross(G_sum1_elite, G_sum1_rank)
% 균등교차를 통해 배열 정리하는 함수
% 적응도 1위 3위는 M1으로 패턴 정리
% 적응도 2위 4위는 M2로 패턴 정리

G_sum2 = G_sum1_cross;
G_sum2_fit = eval_fitness(G_sum2)
G_sum2_rank = eval_rank(G_sum2_fit)
G_sum2_elite = keep_elite(G_sum2, G_sum2_rank)
G_sum2_cross = cross(G_sum2_elite, G_sum2_rank)

G_sum3 = G_sum2_cross;
G_sum3_fit = eval_fitness(G_sum3)
G_sum3_rank = eval_rank(G_sum3_fit)
G_sum3_elite = keep_elite(G_sum3, G_sum3_rank)
G_sum3_cross = cross(G_sum3_elite, G_sum3_rank)

G_sum4 = G_sum3_cross;
G_sum4_fit = eval_fitness(G_sum4)
G_sum4_rank = eval_rank(G_sum4_fit)
G_sum4_elite = keep_elite(G_sum4, G_sum4_rank)
G_sum4_cross = cross(G_sum4_elite, G_sum4_rank)

G_sum5 = G_sum4_cross;
G_sum5_fit = eval_fitness(G_sum5)
G_sum5_rank = eval_rank(G_sum5_fit)
G_sum5_elite = keep_elite(G_sum5, G_sum5_rank)
G_sum5_cross = cross(G_sum5_elite, G_sum5_rank)

G_sum6 = G_sum5_cross;
G_sum6_fit = eval_fitness(G_sum6)
G_sum6_rank = eval_rank(G_sum6_fit)
G_sum6_elite = keep_elite(G_sum6, G_sum6_rank)
G_sum6_cross = cross(G_sum6_elite, G_sum6_rank)

G_sum7 = G_sum6_cross;
G_sum7_fit = eval_fitness(G_sum7)
G_sum7_rank = eval_rank(G_sum7_fit)
G_sum7_elite = keep_elite(G_sum7, G_sum7_rank)
G_sum7_cross = cross(G_sum7_elite, G_sum7_rank)