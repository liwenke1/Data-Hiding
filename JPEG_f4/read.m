STEGO='stego.jpg';
mlen=16808;

tic;
messageste=f4_extract(STEGO,mlen);
T=toc;
frr=fopen('wen1.txt','w');
fwrite(frr,messageste,'ubit1');
fprintf("-----\n");
fprintf("nsF5 extract finished\n");
fprintf("message:%d\n",messageste);
fprintf("elapsed time: %4.f seconds\n",T);