pix_num=0;
pix_val=0;
for i=1:192
    for j=1:192
        y(i,j) = X(i,j,1);
        if(y(i,j)>0)
            pix_num=pix_num+1;
             temp=y(i,j);
            pix_val=double(pix_val)+double(temp);
        end
    end
end
pix_num
pix_val

%variable difination
a=6.0847;
b=-344.2230;
CSA=18.685; %cm2;
Hscale=sqrt(CSA/pix_num)
format long
%Read pixel value,calculate rou & E matrix
rou_sum=0;
for i=1:192
    for j=1:192
        pixel(i,j) = X(i,j,1);
        rou(i,j)=a*double(pixel(i,j))+b;%g/cm3        
        if(pixel(i,j)>0)           
            rou_sum=double(rou_sum)+double(rou(i,j));
        end
    end
end
rou_sum
averou=rou_sum/pix_num