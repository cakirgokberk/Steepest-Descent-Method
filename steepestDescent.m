function [Y,X,iter] = steepestDescent(f,gradient,N_max,x0,e1,e2,e3,lowerLimit,upperLimit) 
% Gokberk Cakiroglu
% 91190000183, Electrical Electronics Engineering
% Optimization Theory
% Class Assignment  - Steepest Descent Algorithm
% 28/11/2020



iter = 0;
xk = x0;

while 1   
    pk = -1.*gradient(xk(1),xk(2))     ;
    
   
    g = @(sk) ( f(xk(1)+sk*pk(1),xk(2)+sk*pk(2))); 
   
    [x2_g] = goldenSection(g,lowerLimit,upperLimit,1e-9);
    
   
    sk = x2_g;
    
    old_xk = xk; 
    xk = xk + sk.*pk;
    
    
    iter = iter +1;
    
    if iter>N_max
        fprintf('k becomes larger then Nmax\n');
        break;
   
    elseif abs(( f(xk(1),xk(2)) - f(old_xk(1),old_xk(2)) )) < e1
        fprintf('Fx+1 - Fx<e1');
        break;        
   
    elseif norm(xk - old_xk)<e2                 
        fprintf('norm of x+1 - x<e2');
        break;
  
    elseif norm(gradient(xk(1),xk(2)))<e3       
        fprintf('norm of Fx+1<e2');
        break;
        
    end
    
end
    Y = f(xk(1),xk(2));                         
    X = xk;
end