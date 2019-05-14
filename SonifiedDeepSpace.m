hubble = imread('Hubble-Massive-Panorama.png');
imshow(imbinarize(hubble));

amplitudes = zeros(900,1024);
freqs = zeros(900,1024);

for i = 1:900
   for j = 1:1024
       if ([hubble(i,j,1) hubble(i,j,2) hubble(i,j,3)]< [30 30 30]) ~= [1 1 1]
           amplitudes(i,j) = 11-ceil(i/90);
           freqs(i,j) = j;
       else
           amplitudes(i,j) = 0;
           freqs(i,j) = j;
       end
   end
end




