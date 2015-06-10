

fnames = dir(['./*.png']);

for i = 1:length(fnames)

	im = imread(fnames(i).name);

	% imshow(im);

	newIm = imresize(im, [768 1024]);

	imwrite(newIm, ['../ResizedPics/' fnames(i).name]);

end



