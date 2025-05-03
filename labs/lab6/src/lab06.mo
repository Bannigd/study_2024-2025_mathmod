model lab06 // SIR
  parameter Real alpha=0.02;
  parameter Real beta=0.01;
  parameter Real I0=100;
  parameter Real R0=20;
  parameter Real S0=9654-I0-R0;
  
  Real S(start=S0);
  Real I(start=I0);
  Real R(start=R0);
equation 
  // случай I0 > I*
//  der(S) = -alpha*S;
//  der(I) = alpha*S - beta*I;
  // случай I0 <= I*
  der(S) = 0;
  der(I) = -beta*I;
  der(R) = beta*I;
annotation(
    experiment(StartTime = 0, StopTime = 700, Interval = 0.01));
end lab06;