%����Matlab�Դ�������ȡ����ͼ��stego.bmp���õ�����ͼ�����Ϣ����ͼ��ת��Ϊ������
Picture=imread('stego.bmp');
Picture=double(Picture);
[m,n]=size(Picture);

%�򿪴��������Ϣ���ļ�����û�����½�һ���ļ���˳���ȡͼ����Ӧ������LSB������Ϣ���洢�ڴ򿪵��ļ��б���
frr=fopen('message.txt','w');
len=80;
p=1;
for f2=1:n
    for f1=1:m
        if bitand(Picture(f1,f2),1)==1
            fwrite(frr,1,'ubit1');
            result(p,1)=1;
        else
            fwrite(frr,0,'ubit1');
            result(p,1)=0;
        end
        if p==len
            break;
        end
        p=p+1;
    end
    if p==len
        break;
    end
end
fclose(frr);