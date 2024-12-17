function [ x, fval, output ] = MICDCSolver( MICDC ) 


n     = MICDC.n     ;       % 整数决策变量个数
vtype = MICDC.vtype ;       % 决策变量类型为两个连续变量
    
c     = MICDC.c     ;
Aineq = MICDC.Aineq ;
bineq = MICDC.bineq ;
Aeq   = MICDC.Aeq   ;
beq   = MICDC.beq   ;
lb    = MICDC.lb    ;        % 决策变量下边界
ub    = MICDC.ub    ;        % 决策变量上边界

% ops = optimoptions( 'linprog'  , ...
%                     'Algorithm', 'dual-simplex', ...
%                     'display'  , 'none' ) ;
% ops = optimoptions( 'linprog'  , ...
%                     'Algorithm', 'interior-point', ...
%                     'display'  , 'none' ) ;

ops = optimoptions( 'linprog'  , ...
                    'Algorithm', 'interior-point-legacy', ...
                    'display'  , 'none' ) ;
                
[ x       , ...
  fval    , ...
  exitflag, ...
  output  , ...
  lambda  ] = linprog( c    ,        ...
                       Aineq, bineq, ...
                       Aeq  , beq  , ...
                       lb   , ub   , ops ) ;

output.exitflag = exitflag ;
output.lambda   = lambda   ;

end




