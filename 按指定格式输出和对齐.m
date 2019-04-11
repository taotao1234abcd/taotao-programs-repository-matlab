
if display == 'y'
    clc
    disp('                             LOAD-FLOW STUDY')
    disp('                    REPORT OF POWER FLOW CALCULATIONS ')
    disp(' ')
    disp(date)
    fprintf('NUMBER OF BUSES            : %g \n', size(bus_sol,1))
    fprintf('NUMBER OF ITERATIONS       : %g \n', iter)
    fprintf('SOLUTION TIME              : %g sec.\n',etime(ste,st))
    fprintf('TOTAL TIME                 : %g sec.\n',etime(clock,tt))
    fprintf('TOTAL REAL POWER LOSSES    : %g.\n',P_loss)
    fprintf('TOTAL REACTIVE POWER LOSSES: %g.\n\n',Q_loss)
    if conv_flag == 0
        disp('                                      GENERATION             LOAD')
        disp('       BUS     VOLTS     ANGLE      REAL  REACTIVE      REAL  REACTIVE ')
        
        for m = 1:size(bus_sol,1)
            for n = 1:size(bus_sol,2)
                if abs(bus_sol(m,n)) < 1e-9
                    bus_sol(m,n) = 0;
                end
            end
        end
        
        for i = 1:size(bus_sol,1)
            fprintf('%10d%10.4f%10.4f',bus_sol(i,1:3));
            
            if max(abs(bus_sol(i,4:5))) > 1e-9
                fprintf('%10.4f%10.4f',bus_sol(i,4:5));
            else
                fprintf('      -         -   ');
            end
            
            if max(abs(bus_sol(i,6:7))) > 1e-9
                fprintf('%10.4f%10.4f\n',bus_sol(i,6:7));
            else
                fprintf('      -         -   \n');
            end
            
        end
        fprintf('\n');
        disp('                      LINE FLOWS                     ')
        disp('      LINE  FROM BUS    TO BUS      REAL  REACTIVE   ')  
        for i = 1:size(line_ffrom,1)
            fprintf('%10d%10d%10d%10.4f%10.4f\n',line_ffrom(i,1:5));
            fprintf('%10d%10d%10d%10.4f%10.4f\n',line_fto(i,1:5));
        end
    end
end

