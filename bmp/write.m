%���� matla�Դ�������ȡ����ͼ��cover.bmp���õ�����ͼ��Ĵ�С���Ҷ�ֵ����Ϣ������ͼ��ת��Ϊ������
Picture=imread('cover.bmp');
Double_Picture=Picture;
Double_Picture=double(Double_Picture);

%��ȡ������Ϣ�ļ�Ϊ��������������ΪǶ��ͼ����׼��
wen.txt_id=fopen('wen.txt','r');
[msg,len]=fread(wen.txt_id,'ubit1');

%����LSB�㷨����������Ϣ�Ķ�����������������������������
[m,n]=size(Double_Picture);
p=1;
for f2=1:n
    for f1=1:m
        Double_Picture(f1,f2)=Double_Picture(f1,f2)-mod(Double_Picture(f1,f2),2)+msg(p,1);
        if(p==len)
            break;
        end 
        p=p+1;
    end
    if p==len
        break;
    end
end

%���õ�������ͼ�񱣴�Ϊstego.bmp��������Matlab������ͼ������ͼ����ͬһ�Ի����н��бȽ�
Double_Picture=uint8(Double_Picture);
imwrite(Double_Picture,'stego.bmp');
subplot(121);imshow(Picture);title('δǶ����Ϣ��ͼ��');
subplot(122);imshow(Double_Picture);title('Ƕ����Ϣ��ͼ��');
fclose(wen.txt_id);
