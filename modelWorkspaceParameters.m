%% INFO
% These are default parameter values for building.
% Don't run this file if you're not building a new target.
% The same parameters are in a 'pars.mat' file which should be loaded
% during startup of the Speedgoat.
pars.AU1 = 10*pi/180; 
pars.AU2 = 0;
pars.AU3 = 0;
pars.AW  = 0;
pars.FU1 = 0.1;
pars.FU2 = 0;
pars.FU3 = 0;
pars.FW = 0;
pars.GainU1 = single(1);       
pars.GainU2 = single(1);
pars.GainU3 = single(1);
pars.GainW = single(1);
pars.KP1 = single(1);
pars.KP2 = single(1);
pars.KP3 = single(1);
pars.KI1 = single(0);
pars.KI2 = single(0);
pars.KI3 = single(0);
pars.KD1 = single(0);
pars.KD2 = single(0);
pars.KD3 = single(0);
pars.N1 = single(100);
pars.N2 = single(100);
pars.N3 = single(100);
pars.SatU1 = single(10*pi/180);
pars.SatU2 = single(10*pi/180);
pars.SatU3 = single(10*pi/180);
pars.SatW = single(0.3);
pars.qref = single([40; -30; -90]*pi/180);
pars.controlMode = 0;