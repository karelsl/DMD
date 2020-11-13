function delka = pathLength(path)

for i = 1:length(path)-1
    X = [path(i,1),path(i,2);path(i+1,1),path(i+1,2)];
    dl = pdist(X,'euclidean');
    delka = delka+dl;
    
end