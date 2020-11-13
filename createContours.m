function contCelk = createContours(a)

for k = 2:length(a) 
                
x = a{1,k}(:,1);
y = a{1,k}(:,2);
disp(length(x))
disp(length(y))
plot3(x,y,k*ones(length(x),1))
hold on
i = 1;
while(~isempty(x))
    for j = 1 : length(x)
        if isnan(x(j))
            xy = [x(1:j-1) y(1:j-1)];
            cont{1,i}=xy;
            x(1:j) = [];
            y(1:j) = [];
            i = i+1;
            break;
        end
    end
end
contCelk{1,k-1} = cont; 
cont = [];
end
% contCelk{1,1} = [];