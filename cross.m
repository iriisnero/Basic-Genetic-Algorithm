% 균등 교차 함수
% function G_cross = cross(G_elite, rank)
% 입력은 엘리트 보존된 행렬 G_lite 와 순위 rank
% 출력은 교차된 행렬 G_cross

function G_cross = cross(G_elite, rank)

M1 = [0 1 1 1 1 1];
M2 = [0 0 0 1 1 1];

G_cross = [];
% 구하는 출력 G_cross

rank_t = rank';
% rank_t 는 rank 의 전치 행렬

mid_cal = [G_elite rank_t];
% mid_cal 행렬은 엘리트 보존된 행렬 G_elite 에 rank의 전치행렬이 추가됨

for i = 1:4 % rank 가 2, 3 인지 찾는 반복문
    for j = 1:4 % rank 가 1, 4인지 찾는 반복문
        for k = 1:6 % M1, M2 의 위치를 찾는 반복문
            if( mid_cal(i,7) == 2 & mid_cal(j,7) == 1 & M1(k) == 0 )
                G_cross(i,k) = G_elite(i,k);
                G_cross(j,k) = G_elite(j,k);
            elseif( mid_cal(i,7) == 2 & mid_cal(j,7) == 1 & M1(k) ~= 0 )
                G_cross(i,k) = G_elite(j,k);
                G_cross(j,k) = G_elite(i,k);
            elseif( mid_cal(i,7) == 3 & mid_cal(j,7) == 4 & M2(k) == 0 )
                G_cross(i,k) = G_elite(i,k);
                G_cross(j,k) = G_elite(j,k);
            elseif( mid_cal(i,7) == 3 & mid_cal(j,7) == 4 & M2(k) ~= 0 )
                G_cross(i,k) = G_elite(j,k);
                G_cross(j,k) = G_elite(i,k);
            end
        end
    end
end
% rank 가 1,2 이고 M1 의 패턴이 0이면 그대로
% rank 가 1,2 인데 M1 의 패턴이 1이면 상대방 패턴
% rank 가 3,4 이고 M2 의 패턴이 0이면 그대로
% rank 가 3,4 인데 M2 의 패턴이 1이면 상대방 패턴
% 현재 rank 는 엘리트 보존 이전의 rank
% 즉 1,2위 결합은 실제로는 1,3위 결합이고 3,4위 결합은 실제로는 2,4위 결합임

G_cross;

end