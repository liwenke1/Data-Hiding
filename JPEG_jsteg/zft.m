%ԭ����DCTϵ��ֱ��ͼ
COVER = 'cover.jpg';
jobi=jpeg_read(COVER);
DCT1 = jobi.coef_arrays{1};
change1=true(size(DCT1));
change1(1:8:end,1:8:end)=false;
change1=find(change1==0);
DCT1(change1)=[];
%nbins1=200;��ʱ����
edges1=[-100 -16:1:16 100];

%Ƕ����Ϣ��DCTϵ��ֱ��ͼ
STEGO = 'stego.jpg'; 
jobj=jpeg_read(STEGO);
DCT2 = jobj.coef_arrays{1};
change2=true(size(DCT2));
change2(1:8:end,1:8:end)=false;
change2=find(change2==0);
DCT2(change2)=[];
nbins2=200;
edges2=[-100 -16:1:16 100];
figure,h1=histogram(DCT1,edges1,'FaceColor','r');
hold on
h2=histogram(DCT2,edges2,'FaceColor','g');
ylim([0,20000]);%���Ƹ߶� ��ѡ�ֶ� ��������Ч������
print(gcf,'-dpng','zf.png');
%print(gcf,'-dpng','zf1.png');�����Ƹ߶�