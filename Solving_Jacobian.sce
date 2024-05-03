
    clc
    close
    clear
    
    //subrotina
    //avalia f e J
    
    function [f,J]=modelo(C,kAB,kBC,kAD,CAf,F,V)
        
      f=[F/V*(CAf-C(1))-kAB*C(1)-kAD*C(1)^2;-F/V*C(2)+kAB*C(1)-kBC*C(2)];
      J(1,1)=-F/V-kAB-2*kAD*C(1);
      J(1,2)=0;
      J(2,1)=kAB;
      J(2,2)=-F/V-kBC;
      
    endfunction
    
    //programa principal
    
    //parâmetros
    kAB=5/6; //min^(-1)
    kBC=5/3; //min^(-1)
    kAD=1/6; //1/(mol min)
    CAf=10; //mol/l
    F=4; //1/min
    V=7; //1
    
    //entrada do newton
    
    C=[1;1]; //estimativa inicial
    tol=1E-10; //tolerância
    erro=1; //erro inicial
    
    while erro > tol
        [f,J]=modelo(C,kAB,kBC,kAD,CAf,F,V); 
        Cnew=C-inv(J)*f;
        erro=abs(Cnew(1)-C(1))+abs(Cnew(2)-C(2));
        C=Cnew;
        
    end
    
    disp(Cnew);
    
    [f,J]=modelo(C,kAB,kBC,kAD,CAf,F,V)
