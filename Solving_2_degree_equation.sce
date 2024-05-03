
    //programa para resolver uma equação do segundo grau
    //entrada
    //coeficientes a,b e c
    //saida
    //raizes (x)
    
    clc
    clear 
    close
    
    function x=calcula(a,b,c)
      
     //calcular delta
    
    delta=b^2-4*a*c;
    
    //calcular as raizes
    
    x(1)=(-b+sqrt(delta))/(2*a);
    x(2)=(-b-sqrt(delta))/(2*a);
    
    endfunction
    
    a=2;
    b=3;
    c=5;
    
    //chamar a rotina calcula
    
    x=calcula(a,b,c);
    
    //imprimir os resultdos
    disp("As raízes são:")
    disp(x);
    
