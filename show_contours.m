% show the character's contours
%file = load('-text','test.txt');
%file
%contours = load(file);
%contours=load('contours/targent_n_contour.dat');
contours=load('contours/standard/N_contours.dat');
%load('contours1.dat');
%load('contours2.dat');
plot(contours(:,1),contours(:,2),'b+')

height = 110;

%figure(1)
%plot(contours1(:,1),contours1(:,2),'b+')
%figure(2)
%plot(contours2(:,1),contours2(:,2),'r+')
%save -ascii octave_a.mat contours % MATLAB 6 compatible