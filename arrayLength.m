function delka = arrayLength(a)

delka = 0;

for i = 1:length(a(:,1))-1
    X = [a(i,1),a(i,2);a(i+1,1),a(i+1,2)];
    dl = pdist(X,'euclidean');
    delka = delka+dl;
end