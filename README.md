# Basic_Genetic_Algorithm_Using_Matlab
## Basic Genetic Algorithm using Matlab.    
The problem I'm trying to solve is about distribution of properties.   
For example, there are 2.1 billion[won] for three siblings A, B, C to get inherited.   




## Matlab을 이용한 기초 유전 알고리즘 문제입니다.    
재산을 분배하는 문제를 유전 알고리즘을 사용하여 해결합니다.    
예를 들어 21억의 유산을 세 남매 A, B, C가 정해진 비율에 맞게 상속받는 것입니다.    
입력 유전자는 4개이며 eval_fitness, eval_rank, keep_elite, cross 함수에 차례로 들어갑니다.   
- eval_fitness     
적합도를 평가하는 함수입니다.  
입력받은 4개의 유전자를 목표치와 비교하여 차이를 계산합니다.  
목표치와의 차이는 절댓값으로 계산합니다.  
출력은 4x4 행렬이며 1~3열은 입력받은 유전자별로 A,B,C가 상속받을 금액의 합입니다.  
4열은 적합도를 계산한 값으로 목표치와의 차이이며 낮을수록 목표치와 근접한 값입니다.  
- eval_rank
적합도 평가를 사용하여 순위를 계산하는 함수입니다.  
