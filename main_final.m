function main_final(triangles, layer_h, width, okraje,ax_gr2)

[a,b] = slice_stl_create_path(triangles,layer_h);
okraj = MyClass();
vypln = MyClass();

k = 1; pos_nan = 0; xy = a;
pom = 0; delky =[];
for i = 2:length(b)
    xy = a{1,2};
    x = xy(:,1);
    y = xy(:,2);
    for j = 1:length(x)
        if ~isnan(x(j))
            okraj(k).pos_x(j-pos_nan) = x(j);
            okraj(k).pos_y(j-pos_nan) = y(j);
            okraj(k).pos_z(j-pos_nan) = b(i);
        else
            pom = pom+1;
            okraj(k).vrstva = i-1;
            k = k+1;
            pos_nan = j;
        end
    end
    
    %Spocitam delky okrajovych krivek
    for i = (k-1):-1:(k-pom)
        delky(i) = okraj(i).spoctiDelku();
        s = strcat('Delka: ', num2str(delky(i)));
        
    end
    %urcim nejdelsi okrajovou krivku
    maxD = max(delky);
    %disp(maxD);
    
    for i = (k-1):-1:(k-pom)
        if okraj(i).spoctiDelku()==maxD
            okraj(i).vnejsi = 1;
        else
            okraj(i).vnejsi = 0;
        end
    end
    
    %urcim vnejsi/vnitrni krivka
    
    %    disp(pom);
    pom=0;
    pos_nan = 0;
    
end


%Vypocet vyplni
pocVyplni =1;
for i = 1:length(okraj)
    pomX = okraj(i).pos_x;
    pomY = okraj(i).pos_y;
    
    for j = 1:okraje
        if okraj(i).vnejsi == 1
            [xo2, yo2] = offsetCurve(pomX,pomY, -width*1.1);            
        else
            [xo2, yo2] = offsetCurve(pomX,pomY, width);          
        end
        
        
        zo2 = max(okraj(i).pos_z)*ones(1,length(xo2));
        %         plot3(xo2,yo2,zo2)
        vypln(pocVyplni).pos_x = xo2;
        vypln(pocVyplni).pos_y = yo2;
        vypln(pocVyplni).pos_z = zo2;
        pomX = xo2;
        pomY = yo2;
        pocVyplni = pocVyplni+1;
    end
end

trajektorieVyplne =[];
%vypocet celkove trajektorie
for i = 1:length(vypln)
    
    trajektorieVyplne = [trajektorieVyplne,[vypln(i).pos_x;vypln(i).pos_y;vypln(i).pos_z]];
    
end
plot3(ax_gr2,trajektorieVyplne(1,:),trajektorieVyplne(2,:),trajektorieVyplne(3,:))
end


