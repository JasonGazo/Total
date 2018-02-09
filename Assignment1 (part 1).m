

%%               *Assignment#1-Part 1:Electron Modelling*
%
%Jason Gazo (100975245)                                  Date: Feb/04/2018
 
%The purpose of this script is to define the parameters for the movie and
%to initialize the thermal velocity, number of particles, size of window,
%and mass of particles. The bottom of the script runs the movie.

    clc
    clear all


    %effective mass of electrons =mn
    %rest mass mo in kg
    mo=9.109*10^-31;
    m=0.26*mo;
    %botlzman constant
    kb=1.38064*10^-23;


    %%Question 1: Solve for thermal velocity:
    vt=@(t) sqrt(kb*t/m);
    vth=vt(300);
    fprintf('The expected thermal velocity is %6.4f m/s \n',vt(300))

    %%Question 2: Solve for the mean free path:
    fprintf('The expected mean time between collisions is 0.200e-12 seconds \n')
    %mean time collisions is 0.2 ps
    tmn=0.2*10^-12;
    %mean free path
    mnfreepath=tmn*vt(300);
    fprintf('The expected mean free path is %6.4f e-08 meters\n',mnfreepath*10^8)


    %Nominal size of region is 200nmx100nm
    fprintf('-----------------------------------------------------------\n')
    w=200*10^-9;

    l=100*10^-9;

    %Setting the time step:
    deltaT=7.562*10^-15;
    num=10;
    %Call the function to run the movie (Ex:10 particles will be used here)





    %Randomize the initial location of the particles in the frame
    vertarray=rand(num,1)*w;
    horarray=rand(num,1)*l;

    %Generate the array of velocities and random angles (0 -> 2*pi)

    angles=rand(num)*2*pi;
    vx=ones(num,1);
    vy=ones(num,1);
    vrms=ones(num,1);

    %All particles will have the same velocity except with a random trajectory
    for i=1:num
        vx(i)=cos(angles(i))*vth;
        vy(i)=sin(angles(i))*vth;
    end


    sumtemp=0;

    %%Movie begins here for a total of 400 iterations
    for i=1:400
    
        %horizontal periodic boundary behaviour
        horarray(horarray>=l)=horarray(horarray>=l) - l;
        horarray(horarray<=0)=horarray(horarray<=0)+l; 
    
        %vertical reflection boundary behaviour
        IT=[vertarray>=w];
        vy(IT)=-vy(IT);
        IT=[vertarray<=0];
        vy(IT)=-vy(IT);
   
        %Temperature Checker
        vrms=sqrt((sum(abs(vx))/num)^2+(sum(abs(vy))/num)^2);
        Temp=m*mean(vrms.^2)/kb;
    
        %Average Temperature 
        sumtemp=sumtemp+Temp;
        avgtemp=sumtemp/i;
    
        %Plot the temperature of the particles
        subplot(2,1,2)
        plot(i*deltaT,Temp,'+')
        title('Temperature over Time')
        ylabel('Temperature (kelvin)')
        xlabel('Time')
        ylim([0 Temp+Temp*1.25])
        hold on
    
        %Update the particle's coordinates by their x- and y- velocities
        horarray=horarray+vx.*deltaT;
        vertarray=vertarray+vy.*deltaT;
   
        %Plot the movement of the particles
        subplot(2,1,1)
        plot(horarray,vertarray,'.')
        title('Movement of Electrons')
        xlim([0 l])
        ylim([0 w])
        hold on 
        pause(.01)
    
    end
    %Movie ends



%The movie runs properly.The particles reflect off the vertical (top and
%bottom) boundaries of the frame. The particles pass between the two 
%horizontal boundaries. The temperature remains constant (300k) since there
%aren't any scattering events. The expected thermal velocity is 1.3 e5 m/s
%and the expected mean free path is 2.6e-9 m. 
