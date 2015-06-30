Size2=60;
alfa2=linspace(40,45,Size2);
beta2=linspace(40,45,Size2);

syms y;
rou = 2;

for i=1:Size2
    for j=1:Size2
        U2(i,j)=9.975/(pi*(alfa2(i)*rou^beta2(j)));
    end
    i
end
figure;
U1=double(U1);
mesh(alfa,beta,U1)