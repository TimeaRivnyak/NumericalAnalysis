function [] = my_compare(func,y,T,rate,y0)
set=[10,100,1000];
explicit_result=y(T);

    for i=1:size(set,2)
       result_e=euler(func,y0,T,set(i));
       result_b=back_euler(func,y0,T,set(i));
       result_c=crankitup(func, y0, T, set(i));
       
       if(abs(result_e-explicit_result)<rate)
       fprintf("Euler method for N= %d is in the rate\n", set(i))
       else
       fprintf("Euler method for N= %d is bad \n", set(i))
       end
       if(abs(result_b-explicit_result)<rate)
       fprintf("Back-Euler method for N= %d is in the rate\n", set(i))
       else
       fprintf("Back-Euler method for N= %d is bad\n", set(i))
       end
       if(abs(result_c-explicit_result)<rate)
       fprintf("Crank-Nic. method for N= %d is in the rate\n", set(i))  
       else
       fprintf("Crank-Nic. method for N= %d is bad\n", set(i))      
       end
      
    end


end