%-------------------------------------------------------------------------%
%                  SOLVING BLOCKING PROBABILITY EQUATION                  %
%-------------------------------------------------------------------------%
clc;
%Declare variables
syms numberOfServers x S
Lambda = 220;
Mu = 230;
%efficiency or utilization
Rhohat = Lambda/Mu;
fprintf("-----------------------------------\n");
fprintf("| Servers | Blocking Probability  |\n");
fprintf("-----------------------------------\n");
%For loop to increment number of servers till the Ec(numberOfServers,Rhohat) < 0.05
for numberOfServers = 1:inf
    Rho = Rhohat / numberOfServers;
    Numerator = (Rhohat.^numberOfServers)/factorial(numberOfServers);
    Sigma = symsum(Rhohat.^x/factorial(x),x,0,numberOfServers-1);
    Denominator = Numerator + (1-Rho)*Sigma;
    finalValue = Numerator / Denominator;
    fprintf("|   %d     |          %.2f         |\n",numberOfServers,finalValue);
    fprintf("-----------------------------------\n");
    if finalValue < 0.05
        break
    end
end