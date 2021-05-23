%利用Matlab自带函数读取隐秘图像stego.bmp，得到隐秘图像的信息并将图像转化为二进制
Picture=imread('stego.bmp');
Picture=double(Picture);
[m,n]=size(Picture);

%打开存放秘密信息的文件，若没有则新建一个文件。顺序读取图像相应的像素LSB秘密信息，存储在打开的文件中保存
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