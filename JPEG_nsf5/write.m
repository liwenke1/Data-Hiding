%%% setup
COVER = 'cover.jpg'; % cover image (grayscale JPEG image)
STEGO = 'stego.jpg'; % resulting stego image that will be created
SEED = 99; % PRNG seed for the random walk over the coefficients
wen.txt_id=fopen('wen.txt','r');
[message,len]=fread(wen.txt_id,'ubit1');


tic;
[nzAC] = nsf5_simulation(COVER,STEGO,SEED,message);
T = toc;

fprintf('-----\n');
fprintf('nsF5 simulation finished\n');
fprintf('cover image: %s\n',COVER);
fprintf('stego image: %s\n',STEGO);
fprintf('PRNG seed: %i\n',SEED);
fprintf('number of nzACs in cover: %i\n',nzAC);
fprintf('elapsed time: %.4f seconds\n',T);

