clear;
Size=60;
alfa=linspace(5,7,Size);
beta=linspace(5,7,Size);

syms y;
rou = 2;

for i=1:Size
    for j=1:Size
        int1=int((1-y^2)^(beta(j)/2),-1,1);
        int2=int((1-y^2)^(beta(j)/2),-1,1);
        int3=int((y^2)*(1-y^2)^(beta(j)/2),-1,1);
        U1(i,j)=1/(2*alfa(i)*((2*rou)^beta(j))*int1)+1.2/(0.8*alfa(i)*((2*rou)^beta(j))*int2)+9/(2*alfa(i)*((2*rou)^beta(j))*int3);
    end
    i
end

Size2=60;
alfa2=linspace(5,7,Size2);
beta2=linspace(5,7,Size2);

syms y;
rou = 2;

for i=1:Size2
    for j=1:Size2
        U2(i,j)=19.975/(pi*(alfa2(i)*rou^beta2(j)));
    end
    i
end
figure;
U1=double(U1);
mesh(alfa,beta,U1);hold on 
U2=double(U2);
mesh(alfa2,beta2,U2);