A = imread('kidne without stone 3.jpg');
subplot(331)
imshow(A);
title('original image') 

B = rgb2gray (A);
subplot(332)
imshow(B);
title('rgb2gray image') 

subplot(333) 
imhist(B) 
title('hist image') 
impixelinfo; 

% Intensity
 C = B > 20;
 subplot(334)
 imshow(C);
 title('intensity image')

%  Fill image region and holes
D = imfill (C, 'holes');
subplot(335)
imshow (D); 
title('fill image region and hole')

% Remove small objects from binary image
E = bwareaopen (D,1000);
subplot(336)
imshow(E);
title('Remove small objects') 

% Repeat copies of array PreprocessedImage = uint8 (double (A).* repmat (E, [1 1 3])); subplot (337) imshow(PreprocessedImage); title('Preprocessed Image') 

% Adjust image intensity values PreprocessedImage imadjust (PreprocessedImage, [0.3 0.71, 1) + 50; subplot (338) imshow(PreprocessedImage); 
title ('Preprocessed Image')

 F= rgb2gray (PreprocessedImage) ; 
subplot(339)
imshow(F);
title('detection of specific part')

 figure; 
G= medfilt2 (F, [5 5]); subplot (221)
imshow(G);
title('median filter') 

H = G > 250; 
subplot(222)
imshow(H);
title('intensity')

% Row, column, and position
 [r, c] = size (H);
 x1 = r/2; 
y1 = c/3; 
ROW = [x1 x1+200 x1+200 x1]; 
COL [y1y1 y1+40 y1+40]; 

% Binary image 
 BW = roipoly (H, ROW, COL); % Specify polygonal region of interest subplot (223) imshow(BW); title('Binary image') 

K = H.*double(BW);
subplot(224)
imshow(K);
title ('Double')

M = bwareaopen (K, 4); 
[L, number] = bwlabel (M);  % Label connected components in 2-D binary image

if (number >= 1)
   disp('Stone is Detected'); 
   stats = regionprops(L, 'BoundingBox' )  
    for i = 1:number
        boundingBox = stats (i)
        BoundingBox; disp(['Stone', num2str(i), 'dimensions: ']);
        disp(['Width: ', num2str(boundingBox(3))]); 
        disp(['Height: ', num2str(boundingBox (4))]); 
        disp('-------------------');
    end 
else 
   disp('No Stone is detected');
end