%Start of assignment of 2
%width of box is w
%length of box is l


clc
ny=30;
nx=20;
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
temp=G\v';

vmap=zeros(nx,ny);
for i=1:nx
    for j=1:ny
         n=j+(i-1)*ny;
         vmap(i,j)=temp(n);   
        end
end
 
surf(vmap)
 

%part b



clc
ny=30;
nx=20;
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
           v(n)=vx;
       elseif(j==1)
           G(n,:)=0;
           G(n,n)=1;
       elseif(j==ny)
           G(n,:)=0;
           G(n,n)=1;
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
temp=G\v';

vmap=zeros(nx,ny);
for i=1:nx
    for j=1:ny
         n=j+(i-1)*ny;
         vmap(i,j)=temp(n);   
        end
end
figure(2)
surf(vmap)

%b

total=0;
physical=zeros(30,20);

a=30;
b=10;
x=linspace(-10,10,20);
y=linspace(0,30,30);
[xx,yy]=meshgrid(x,y);
figure(3)
for n=1:2:600
    physical=(physical+(cosh(n*pi*xx/a).*sin(n*pi*yy/a))./(n*cosh(n*pi*b/a)));
   
   surf(x,y,(4/pi)*physical) 
   pause(0.01)
end

