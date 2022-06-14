% 엘리트 보존 선택법을 위한 함수
% 입력은 G_sum, rank
% 출력은 4위가 1위로 바뀐 행렬

function G_elite = keep_elite(G_sum, rank)

G_total_original = G_sum;
% 4위와 1위를 교체하기 위해 모든 유전자를 하나로 묶은 행렬

for i = 1:4
    for j = 1:4
        if((rank(i) == 4) & (rank(j) == 1))
            G_total_original(i,:) = G_total_original(j,:);
        end
    end
end
% 4위인 행(= 적응도 4위인 유전자)을 1위인 행(=적응도 1위인 유전자)
% 의 값과 똑같이 함

G_elite = G_total_original;
G_elite;
% 출력은 G_elite
end