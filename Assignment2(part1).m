%Start of assignment of 2
%width of box is w
%length of box is l


clc
L=30;
W=20;
vx=1;

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
 
       
[E,D]=eigs(G,9,'SM');



[x,y]=sort(diag(D));

D=D(y,y);
E=E(:,y);

xscale=linspace(0,1,nx*ny);
% (xscale,E)
physical=zeros(50,50);
mode=1;
[physx,physy]=meshgrid(1:1:50,1:1:50);
for mode=1:9
    for i=1:nx
        for j=1:ny
            n=j+(i-1)*ny;
            physical(i,j)=E(n,mode);
            
        end
    end
        subplot(3,3,mode)
        surf(physical)
    
end
V=G\B'