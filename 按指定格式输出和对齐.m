
if display == 'y'
   clc
   disp('                             LOAD-FLOW STUDY')
   disp('                    REPORT OF POWER FLOW CALCULATIONS ')
   disp(' ')
   disp(date)
   fprintf('NUMBER OF BUSES            : %g \n', size(bus_sol,1))
   fprintf('SWING BUS                  : BUS %g \n', SB)
   fprintf('NUMBER OF ITERATIONS       : %g \n', iter)
   fprintf('SOLUTION TIME              : %g sec.\n',etime(ste,st))
   fprintf('TOTAL TIME                 : %g sec.\n',etime(clock,tt))
   fprintf('TOTAL REAL POWER LOSSES    : %g.\n',P_loss)
   fprintf('TOTAL REACTIVE POWER LOSSES: %g.\n\n',Q_loss)
   if conv_flag == 0
      disp('                                      GENERATION             LOAD')
      disp('       BUS     VOLTS     ANGLE      REAL  REACTIVE      REAL  REACTIVE ')
      for i = 1:size(bus_sol,1)
          fprintf('%10d%10.4f%10.4f%10.4f%10.4f%10.4f%10.4f\n',bus_sol(i,1:7));
      end
      fprintf('\n');
      disp('                      LINE FLOWS                     ')
      disp('      LINE  FROM BUS    TO BUS      REAL  REACTIVE   ')
      for i = 1:size(line_ffrom,1)
          fprintf('%10d%10d%10d%10.4f%10.4f\n',line_ffrom(i,1:5));
      end
      for i = 1:size(line_fto,1)
          fprintf('%10d%10d%10d%10.4f%10.4f\n',line_fto(i,1:5));
      end
   end
end
