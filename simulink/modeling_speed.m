function [sys,x0,str,ts] = modeling_speed(t,x,u,flag, rt_factor_value)

dt = 0.1;
persistent last_time rt_factor


switch flag
    %%%%%%%%%%%%%%%%%%
    % Initialization %
    %%%%%%%%%%%%%%%%%%
    case 0
        last_time = 0;
        rt_factor = rt_factor_value;
    
        sizes = simsizes;
        sizes.NumContStates  = 0;
        sizes.NumDiscStates  = 1;
        sizes.NumOutputs     = 0;
        sizes.NumInputs      = 0;
        sizes.DirFeedthrough = 1;
        sizes.NumSampleTimes = 1;

        sys = simsizes(sizes); % некая общая размерность
        x0 = 0;
        str = [];
        ts  = [dt 0]; % что это?

    % Update: sys = A*x+B*u;
    case 2      
        if ~isempty(last_time)
            delta = t - last_time;
            if delta > 0.1
                last_time = last_time + floor(delta);
                pause(floor(delta) / rt_factor);
            end
        else
            % первый запуск
            last_time = t;
        end
        

        sys = []; % это фиктивное внутреннее состояние размерности 1

    % Output: sys = C*x+D*u;
    case 3        
        % 
        
        
        sys = [];
        

    %%%%%%%%%%%%%
    % Terminate %
    %%%%%%%%%%%%%
    case 9                                                
        sys = []; % do nothing

    %%%%%%%%%%%%%%%%%%%%
    % Unexpected flags %
    %%%%%%%%%%%%%%%%%%%%
    otherwise
        DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end

%end dsfunc
