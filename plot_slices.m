function []= plot_slices(movelist_all, z_slices,delay)

% figure(2)
% hold on;
% view(15,23);
% axis([-Inf Inf -Inf Inf z_slices(1) z_slices(end)])
for i = 1: size(movelist_all,2)
    mlst_all = movelist_all{i};
    if delay >0
    if ~isempty(mlst_all)
        for j = 1:size(mlst_all,1)-1
            plot3(mlst_all(j:j+1,1),mlst_all(j:j+1,2),ones(2,1)*z_slices(i),'b')
            %pause(delay)
        end
    end  
    else
        if ~isempty(mlst_all)
            plot3(mlst_all(:,1),mlst_all(:,2),ones(size(mlst_all,1),1)*z_slices(i),'b')
        end
    end
end   
end