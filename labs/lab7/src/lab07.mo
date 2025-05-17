model lab07 // Эффективность рекламы
  Real a1; // платная реклама
  Real a2; // сарафанное радио
  parameter Real N=1430.;
  parameter Real N0=2.;
  Real n(start=N0);
equation
  der(n) = (a1 + a2*n)*(N-n);
// уравнение 1
//  a1 = 0.62;
//  a2 = 0.000032;
// уравнение 2
  a1 = 0.000024;
  a2 = 0.4;
// уравнение 3
//  a1 = 0.5;
//  a2 = 0.5*time;
annotation(
    experiment(StartTime = 0, StopTime = 0.5, Interval=1e-4));
end lab07;