function [x1,x2,fx1,fx2,tolerance] = goldenSection(func,xLowerLimit,xUpperLimit,xFinalPoint)
% Optimization Theory
% Golden Section Search
% 19/11/2020


    iter=0;
    tao = 0.38197;
    
    tolerance = xFinalPoint/(xUpperLimit - xLowerLimit);
    Err=inf;

    
    x1 = xLowerLimit + tao*(xUpperLimit - xLowerLimit);
    fx1 = func(x1);
    x2 = xUpperLimit - tao*(xUpperLimit - xLowerLimit);
    fx2 = func(x2);
    
    
    
    
    while Err > tolerance
    
    
        
        if fx1>fx2
            
            xLowerLimit = x1;
            
            x1 = x2;
            
            fx1 = fx2;
            
            x2 = xUpperLimit - tao*(xUpperLimit - xLowerLimit);
            
            fx2 = func(x2);
            iter=iter+1;
            
            
            
        elseif fx1<fx2
            
            xUpperLimit = x2;
            
            x2 = x1;
            
            fx2 = fx1;
            
            x1 = xLowerLimit + tao*(xUpperLimit - xLowerLimit);
            fx1 = func(x1);
            iter=iter+1;
          
              
      
   
        end
    Err= abs(xUpperLimit - xLowerLimit); 
    end
    
end
    
    
        
        




 

