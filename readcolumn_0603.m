%variable difination
FUC=1.073;
INTERCEPT=-1024.6;
SLOP=1.2926;
loca=0;
CSA=19.586; %cm2;
Hscale=sqrt(CSA/pix_num)
format long
%Read pixel value,calculate rou & E matrix
pix_num=0;
rou_sum=0;
ave_rou=245.1
for i=1:192
    for j=1:192
        pixel(i,j) = X(i,j,1);
        rou(i,j)=double((1e-3))*(double(FUC)*(double(255)*double(pixel(i,j))-double(INTERCEPT)))/double(SLOP);%g/cm3
        E(i,j)=double(10.5)*double(rou(i,j))^2.57;
        if(pixel(i,j)>0)
            pix_num=pix_num+1;
            rou_sum=double(rou_sum)+double(rou(i,j));
        end
    end
end
pix_num
loca=0;
min=1e20;

%Search balance line
for banl=2:191
    up=0;
    down=0;
    %calculate EA above balance line
    
    for i=1:(banl-1)
        for x=1:192
            if(double(pixel(i,x))>0)
                %temp=pixel(i,x);
                up = (double(up) + double(double(E(i,x))*double(Hscale^2)));
            end
        end
    end
    %calculate EA below balance line
    for i=banl:192
        for x=1:192
            if(double(pixel(i,x))>0)
                %temp=pixel(i,x);
                down=(double(down) + double(double(E(i,x))*double(Hscale^2)));
            end
        end
    end
    diff=(double(up)-double(down));
    diff_abs=abs(diff);
    %search balance line with minimun difference between up and below EA
    if (diff_abs<min)
        min=diff_abs;
        min_sign=diff;
        loca=banl;
    end
end
loca
%ban_val=0;
%for i=1:192
%    ban_val=ban_val+double(pixel(loca,i));
%end

%ban_adjust=min_sign/ban_val;

%loca_out=loca+ban_adjust;
%loca_out
rou_up=0;
for row=1:(loca-1)
    for i=1:192
       if(pixel(row,i)>0)
            %rou=(FUC*(256*pixel(row,i)-double(INTERCEPT))/SLOP);%mg/cm3;
            rou_up=double(rou_up)+double(rou(row,i));
        end
    end
end

rou_down=0;
for row=loca:192
    for i=1:192
        if(pixel(row,i)>0)
            %rou=(FUC*(256*pixel(row,i)-double(INTERCEPT))/SLOP);
            rou_down=double(rou_down)+double(rou(row,i));
        end
   end
end

%rou=double(rou_up)+double(rou_down);
rou_sum
averou=rou_sum/pix_num








