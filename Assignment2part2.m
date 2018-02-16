
%part 2
thetaoutside=1;
thetainside=10^-2;    
L=30;
W=20;
ny=L
nx=W

wb=W*(2/5)
Lb=L*(1/3)


G=sparse(nx*ny,nx*ny);
v=zeros(1,nx*ny);




for i=1:nx
   for j = 1:ny
       n=j+(i-1)*ny;      
       if(i==1)
           G(n,:)=0;
           G(n,n)=1;
           v(n)=vx;
       elseif(i==nx)
           G(n,:)=0;
           G(n,n)=1;
           v(n)=0;
       elseif(j==1)
            G(n,:)=0;
            G(n,n)=-3;
            G(n,n+1)=1;
            G(n,n-ny)=1;
            G(n,n+ny)=1;
      
       elseif(j==ny)
            G(n,:)=0;
            G(n,n)=-3;
            G(n,n-1)=1;
            G(n,n-ny)=1;
            G(n,n+ny)=1;
       else
            G(n,:)=0;
            G(n,n)=-4;
            G(n,n-1)=1;
            G(n,n+1)=1;
            G(n,n-ny)=1;
            G(n,n+ny)=1;
       end
   end
end
temp=G\v'
figure(1)
surface(temp)


Ex=gradient(temp);
Ey=gradient(temp');
Explot = zeros(nx,ny);
for i = 1:nx
    for j = 1:ny
        n = j + (i - 1) * ny;

        Explot(i, j) = Ex(n);
    end
end
figure(2)
surface(Explot)

Eyplot = zeros(nx,ny);
for i = 1:nx
    for j = 1:ny
        n = j + (i - 1) * ny;

        Eyplot(i, j) = Ey(n);
    end
end
figure(3)
surface(Eyplot)


%{
Ex=zeros(nx,ny);
Ey=zeros(nx,ny);



for i = 1:nx
    for j = 1:ny
        if i == 1
            Ex(i, j) = (Vplot(i + 1, j) - Vplot(i, j));
        elseif i == nx
            Ex(i, j) = (Vplot(i, j) - Vplot(i - 1, j));
        else
            Ex(i, j) = (Vplot(i + 1, j) - Vplot(i - 1, j))/2;
        end
        if j == 1
            Ey(i, j) = (Vplot(i, j + 1) - Vplot(i, j));
        elseif j == ny
            Ey(i, j) = (Vplot(i, j) - Vplot(i, j - 1));
        else
            Ey(i, j) = (Vplot(i, j + 1) - Vplot(i, j - 1)) * 0.5;
        end
    end
end
%}