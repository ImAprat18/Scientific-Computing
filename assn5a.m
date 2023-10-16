pkg load image
A = imread("./assn5a_image.jpg");
A = im2double(A);
s = size(A);
disp(s);
edge_det = [-1,-1,-1;-1,8,-1;-1,-1,-1];
emboss = [-2,-1,0;-1,1,1;0,1,2];
bordered_im = padarray(A,[1,1]);
[r,c,ch] = size(A);
B = zeros(r,c);
for l = 1:ch,
  for m = 1:r,
    for n = 1:c,
      disc_element = bordered_im(m:m+2,n:n+2,l);
      edge_pix = sum(sum(disc_element .* edge_det));
      B(m,n,l) = edge_pix;
      emboss_pix = sum(sum(disc_element .* emboss));
      C(m,n,l) = emboss_pix;
    endfor;
  endfor;
endfor;
figure(1);
imshow(A); title("ORIGINAL IMAGE");
figure(2);
imhist(A); title("HISTOGRAM FOR ORIGINAL IMAGE");
figure(3);
imshow(B); title("EDGE DETECTED IMAGE");
figure(4);
imhist(B); title("HISTOGRAM FOR EDGE DETECTED IMAGE");
figure(5);
imshow(C); title("EMBOSSED IMAGE");
figure(6);
imhist(C); title("HISTOGRAM FOR EMBOSSED IMAGE");
