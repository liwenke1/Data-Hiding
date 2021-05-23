function message=f4_extract(STEGO,mlen)

try
    jobj=jpeg_read(STEGO);
    DCT=jobj.coef_arrays{1};
catch
    error('ERROR (problem with the STEGO image)');
end

AC=numel(DCT)-numel(DCT(1:8:end,1:8:end));
changeable=true(size(DCT));
changeable(1:8:end,1:8:end)=false;
changeable=find(changeable);
%rand('state',SEED);
%changeable=changeable(randperm(AC));
idD=1;
for id=1:mlen
    while(DCT(changeable(idD))==0)
        idD=idD+1;
        if(idD>AC)
            break;
        end
    end
    if(mod(DCT(changeable(idD)),2)==0&&sign(DCT(changeable(idD)))==-1)%负偶数
        message(1,id)=1;
    elseif(mod(DCT(changeable(idD)),2)==1&&sign(DCT(changeable(idD)))==1)%正奇数
        message(1,id)=1;
    elseif(mod(DCT(changeable(idD)),2)==0&&sign(DCT(changeable(idD)))==1)%正偶数
        message(1,id)=0;
    else%负奇数
        message(1,id)=0;
    end
    idD=idD+1;
end