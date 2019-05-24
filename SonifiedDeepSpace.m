hubble = imread('Hubble-Massive-Panorama.png');

amplitudes = zeros(900,1024);  % Frequencies and amplitudes are stored seperately.
freqs = zeros(900,1024);

for i = 1:1024
   for j = 1:900
       if ([hubble(j,i,1) hubble(j,i,2) hubble(j,i,3)]< [30 30 30]) ~= [1 1 1] % If  Not Black  
           amplitudes(j,i) = 11-ceil(j/90); % Give amplitude as stated in desc
           freqs(j,i) = j; %% Give freq as stated in desc
       else
           amplitudes(i,j) = 0; %% Amplitude is 0 if it is black pixel 
           freqs(j,i) = j;
       end
   end
end
data = zeros(1024,1001);

for i = 1:1024
    sum = zeros(1,1001);
    for k=1:900
        sum = sum + amplitudes(k,i)*cos(2*pi*freqs(k,i)*0:0.001:1);
    end
    data(i,:) = sum;
end
clear i;
concatanated = [];
for i = 1:1024
    concatanated = [concatanated data(i,:)];
end
audiowrite('hubble.wav',concatanated/max(abs(concatanated)),1001); % Outputs a hubble.wav file
sound(concatanated,1001);
