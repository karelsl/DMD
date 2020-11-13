clc; clear vars; close all;

file_name = 'STL/Body15.stl';
triangles = read_binary_stl_file(file_name);
fv=stlread(file_name);
figure(1)
patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
camlight('headlight');
material('dull');
axis('image');
view([-135 35]);
original = triangles;
triangles = orient_stl(triangles,'x');
slice_height = 2;
tic;[movelist, z_slices] = slice_stl_create_path(triangles, slice_height);toc;
disp('plotting');
plot_slices(movelist,z_slices, 1e-7);

