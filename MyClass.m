classdef MyClass
    properties

        pos_x
        pos_y
        pos_z
        vrstva
        vnejsi
    end
    methods
        function obj = MyClass(val1,val2, val3, val4, val5)
            if nargin > 0
                obj.pos_x = val1;
                obj.pos_y = val2;
                obj.pos_z = val3;
                obj.vnejsi = val4               
                obj.vrstva = val5;
            end
        end
        
        function delka = spoctiDelku(obj)
            delka = 0;
            
            for i = 1:length(obj.pos_x)-1
                X = [obj.pos_x(i),obj.pos_y(i);obj.pos_x(i+1),obj.pos_y(i+1)];
                dl = pdist(X,'euclidean');
                delka = delka+dl;
            end
                
            
        end
    end
end