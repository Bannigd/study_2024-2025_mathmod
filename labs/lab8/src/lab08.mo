model lab08

parameter Real p_cr=49;
parameter Real p1=9.9;
parameter Real p2=11.9;
parameter Real tau1=35;
parameter Real tau2=29;
parameter Real N=50;
parameter Real q=1;


parameter Real a1=p_cr/(tau1*tau1*p1*p1*N*q);
parameter Real a2=p_cr/(tau2*tau2*p2*p2*N*q);
parameter Real b=p_cr/(tau1*tau1*p1*p1*tau2*tau2*p2*p2*N*q);
parameter Real c1=(p_cr-p1)/(tau1*p1);
parameter Real c2=(p_cr-p2)/(tau2*p2);

Real M1(start=7.9);
Real M2(start=9.9);

//parameter Real eps=0; // случай 1
parameter Real eps=0.00042; // случай 2
equation

der(M1) = M1 - (b/c1+eps)*M1*M2 - a1/c1*M1*M1;
der(M2) = c2/c1*M2 - b/c1*M1*M2 - a2/c1*M2*M2;
annotation(
    experiment(StartTime = 0, StopTime = 15));
end lab08;