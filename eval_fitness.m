% 유전자 G1~4 입력받고 적응도 평가 해주는 함수
% G1, G2, G3, G4 를 합친 행렬 G_sum 을 입력
% 출력은 유전자별 A,B,C 가 받을 상속액 과 적응도, 크기는 4x4
% 출력의 1~3 열은 A,B,C 가 받는 상속액, 4열은 적응도

function fitness = eval_fitness(G_sum)

goal = [11 8 3];
% 목표는 11, 8, 3 [억]
fit_G_sum_1 = zeros(4,3);

fit_G_sum = [];
% fit_G_sum 은 G_sum 의 열에 1, 2, 3, 4, 5, 6 [억]을 곱한 값
fit_G_sum_total = zeros(4,1);
% 적응도를 저장할 열벡터, 크기는 4x1

for i = 1:6
    fit_G_sum(:,i) = i * G_sum(:,i);
end
% G_sum 의 열에 1~6억을 곱함

for j = 1:4 % j 는 G_sum, fit_G_sum 의 행 (1~4)
    for k = 1:6 % k 는 G_sum, fit_G_sum 의 열 (1~6)
        if( G_sum(j,k) == 1 )
           fit_G_sum_1(j,1) = fit_G_sum_1(j,1) + fit_G_sum(j,k);
        elseif( G_sum(j,k) == 2 )
           fit_G_sum_1(j,2) = fit_G_sum_1(j,2) + fit_G_sum(j,k);
        elseif( G_sum(j,k) == 3 )
           fit_G_sum_1(j,3) = fit_G_sum_1(j,3) + fit_G_sum(j,k);
        end
    end
end

fit_G_sum_1(:,2) = fit_G_sum_1(:,2) * 0.5;
fit_G_sum_1(:,3) = fit_G_sum_1(:,3) / 3;
% B=2, C=3 으로 설정했으므로 각각 2와 3으로 나눠줌

for k = 1:4 % fit_G_sum_total 의 행
    for l = 1:3 % goal, fit_G_sum_1 의 열
        fit_G_sum_total(k) = fit_G_sum_total(k) + abs( goal(l) - fit_G_sum_1(k,l));
    end
end
% 목표치와 상속액의 차이를 절대값으로 하고 합함
fitness = [fit_G_sum_1 fit_G_sum_total];
fitness;
end