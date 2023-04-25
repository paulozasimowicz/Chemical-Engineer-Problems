
    clc
    close
    clear
    //resolução de equações diferenciais ordinarias
    
    function xdot=f(t,x,mumax,km,D,sf,Y)
      mu=mumax*x(2)/(km+x(2));
      xdot(1)=(mu-D)*x(1);
      xdot(2)=(sf-x(2))*D-mu*x(1)/Y;
    endfunction

    //main
    mumax=0.53;
    km=0.12;
    D=0.3;
    sf=4;
    Y=0.4;
    
    x1aux=linspace(0.1,2,10);
    x2aux=linspace(0.1,4,10);
    
    figure(1)
    for i=1:length(x1aux)
    for j=1:length(x2aux)
        
    x0=[x1aux(i);x2aux(j)]; // ponto de partida da variável dependente
    t0=0; // ponto de partida da variável independente
    t=0:0.1:10; // onde a solução será avaliada
    
    x = ode(x0,t0,t,list(f,mumax,km,D,sf,Y)); // como resolver
    
    
    plot(x(1,:),x(2,:),'k-'); // apresentação dos resultados
    plot(0,4,'bo-');
    plot(1.5373,0.1565,'ro');
    xlabel('x1')
    ylabel('x2')
    
    end
    end
