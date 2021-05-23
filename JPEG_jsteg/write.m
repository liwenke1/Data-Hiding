%%% setup
COVER = 'cover.jpg'; % cover image (grayscale JPEG image)
STEGO = 'stego.jpg'; % resulting stego image that will be created
wen.txt_id=fopen('wen.txt','r');
[message,len]=fread(wen.txt_id,'ubit1');

tic;
[nzAC] = jsteg_simulation(COVER,STEGO,message);
T = toc;

fprintf('-----\n');
fprintf('nsF5 simulation finished\n');
fprintf('cover image: %s\n',COVER);
fprintf('stego image: %s\n',STEGO);
fprintf('number of nzACs in cover: %i\n',nzAC);
fprintf('elapsed time: %.4f seconds\n',T);

