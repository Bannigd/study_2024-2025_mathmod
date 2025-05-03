model lab05 // Lotka-Volterra
  // model parameters
  parameter Real a=-0.71;
  parameter Real b=0.046;
  parameter Real c=0.64;
  parameter Real d=-0.017;
  // Initial values
  //parameter Real x0=4;
  //parameter Real y0=12;
  parameter Real x0=c/d;
  parameter Real y0=a/b;
  Real x(start=x0);
  Real y(start=y0);
  // soft model
  parameter Real eps=0.1;
equation 
  der(x) = a*x+b*x*y;
  der(y) = c*y+d*x*y;
annotation(
    experiment(StartTime = 0, StopTime = 10, Interval = 0.002));
end lab05;