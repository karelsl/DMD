function [] = plot_stl(triangles,h)

v = triangles(:,1:9);
vr = reshape(v',3,size(v,1)*3)';
vrn = zeros(size(vr,1)+size(triangles,1),3);
vrn(1:4:end) = vr(1:3:end);
vrn(2:4:end) = vr(2:3:end);
vrn(3:4:end) = vr(3:3:end);
vrn(4:4:end) = ones(size(triangles,1),3).*[NaN, NaN, NaN];

plot3(h,vrn(:,1)',vrn(:,2)',vrn(:,3)')
% mx = max(max(v));
% mn = min(min(v));
% axis([mn mx mn mx mn mx]);
end
