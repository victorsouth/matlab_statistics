function Psat_Pa = get_sat_pressure(component, T)

if nargin == 1
    T = [];
end

if iscell(component)
    Psat_Pa = cell(length(component), 1);
    for i = 1:length(component)
        Psat_Pa{i} = get_sat_pressure(component{i}, T);
    end
    if ~isempty(T) % передано конкретное значение температуры, 
        % результат просто числа, которые можно передать в виде вектора
        Psat_Pa = cell2mat(Psat_Pa);
    end
    
    return;
end

logPsat = @(T, A, B, C) A - B ./ (T + C);

switch component
    case {'H2O'}
        A = 5.20389;
        B = 1733.926;
        C = -39.485;
        
        		
    case {'CH4'}    
         A=4.22061;
         B=516.689;
         C= 11.223;
         		
         
    case {'C2H6'}
        A = 3.93835;
        B = 659.739;
        C = -16.719;
         
    case {'C3H8'}
        A = 3.92828;
        B = 803.997;
        C = -26.11;
        
    case {'iC4H10', 'i-Butane'}
        A = 4.3281;
        B = 1132.108;
        C = 0.918;
        
		      
    case {'C4H10', 'nC4H10', 'Butane'}
        A = 4.35576;
        B = 1175.581;
        C = -2.071;
        
        
        
    case {'iC5H12','i-Pentane'}
        % взято из нормального пентана
        % T (-50 to 58)
        A = 3.97786;
        B = 1064.84;
        C = -41.136;
        
    case {'C5H12','Pentane'}
        % T (-50 to 58)
        %A = 6.85221;
        %B = 1064.63;
        %C = 233.01;
                
        A = 3.97786;
        B = 1064.84;
        C = -41.136;
    case {'C6H12','Cyclohex'}
        A = 3.93002;
        B = 1182.774;
        C = -52.532;
    case {'C6H14','Hexane'}
        % T (-25 to 92)
        %A = 6.87601;
        %B = 1171.17;
        %C = 224.41;
        A = 4.00139;
        B = 1170.875;
        C = -48.833;
    %case {'C7H16','Heptane'}
        % T (-2 to 124)
        %A = 6.89677;
        %B = 1264.9;
        %C = 216.54;
    case {'C8H18','Octane'}
        A = 4.05075;
        B = 1356.36;
        C = -63.515;
    otherwise
        error(['Cannot find Antoine equation for ' component]);  
end

%Psat_mmHg = @(T) 10.^logPsat(T, A, B, C);
Psat_bar = @(T) 10.^logPsat(T, A, B, C);

%Psat_Pa = @(T) Psat_mmHg(T) / 760 * 101325;
Psat_Pa = @(T) Psat_bar(T) * 1e5;
if ~isempty(T) % передано конкретное значение температуры, считаем для него давление
    Psat_Pa = Psat_Pa(T);
end



end