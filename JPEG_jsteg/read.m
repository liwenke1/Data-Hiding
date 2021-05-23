STEGO='stego.jpg';
%mlen=36;
mlen=16808;

tic;
messageste=jsteg_extract(STEGO,mlen);
T=toc;
frr=fopen('wen1.txt','w');
fwrite(frr,messageste,'ubit1');
fprintf("-----\n");
fprintf("nsF5 extract finished\n");
fprintf("message:%d\n",messageste);
fprintf("elapsed time: %4.f seconds\n",T);