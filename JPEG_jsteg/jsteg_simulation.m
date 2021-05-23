function [AC] = jsteg_simulation(COVER,STEGO,message)
%load the cover image
try
    jobj = jpeg_read(COVER); % JPEG image structure
    DCT = jobj.coef_arrays{1}; % DCT plane
catch
    error('ERROR (problem with the cover image)');
end

AC=numel(DCT)-numel(DCT(1:8:end,1:8:end));%number of nonzero AC DCT coefficients

if(length(message)>AC)
    error('ERROR (too long message)');
end
changeable=true(size(DCT));
changeable(1:8:end,1:8:end)=false;%do not embed into DC modes
changeable=find(changeable);%inedxes of the changeable coefficients;

%rand('state',SEED);%initialize PRNG using given SEED
%changeable=changeable(randperm(AC));%chreate a pseudorandom walk over nonzero AC coefficients
idD=1;
len=length(message);
for id=1:len
    while(abs(DCT(changeable(idD)))<=1)
        idD=idD+1;
        if(idD>=AC)
            break;
        end
    end
    flag=sign(DCT(changeable(idD)));
    DCT(changeable(idD))=DCT(changeable(idD))*flag;
    DCT(changeable(idD))=DCT(changeable(idD))-mod(DCT(changeable(idD)),2)+message(id);
    DCT(changeable(idD))=DCT(changeable(idD))*flag;
    idD=idD+1;
end

%save the resulting stego image
try
    jobj.coef_arrays{1}=DCT;
    jobj.optimize_coding=1;
    jpeg_write(jobj,STEGO);
catch
    error('ERROR (probel with saving the stego image)');
end

function res = invH(y)
% inverse of the binary entropy function
to_minimize = @(x) (H(x)-y)^2;
res = fminbnd(to_minimize,eps,0.5-eps);

function res = H(x)
% binary entropy function
res = -x*log2(x)-(1-x)*log2(1-x);
