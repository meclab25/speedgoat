clear; close all; clc;
Ts = 1e-3;   % Sample-period
Tf = 10;     % Stop-time (for stimulation)
model = 'sg';
open_system(model);
tg = slrealtime('Speedgoat');
stop(tg);
tg.load(model);
Simulink.sdi.view;
Simulink.sdi.loadView('sdi-comau-ref-u');
%% Create some input references
time = Ts:Ts:Tf;
[~, u, ~] = polyPath(time, Tf, [0; 0; 0], [pi/3; pi/2; pi]);
zeroEls = time > (Tf-10*Ts);  % ms zero-ref before Tf
u(:, zeroEls) = single(0);
plot(time, u);
sigs.u1 = timeseries(single(u(1,:).'), time);
sigs.u2 = timeseries(single(u(2,:).'), time);
sigs.u3 = timeseries(single(u(3,:).'), time);
sigs.w = timeseries(single(0), time);
%% Update parameters
load pars.mat;
modelWS = get_param(model, 'ModelWorkspace');
modelWSList = whos(modelWS);
for i = 1:numel(modelWSList)
    name = modelWSList(i).name;
    type = modelWSList(i).class;
    if (strcmp(type, 'double'))
        tg.setparam('', name, pars.(name));
    elseif (strcmp(type, 'single'))
        tg.setparam('', name, single(pars.(name)))
    else
        warning("Could not set {name}");
    end
end
%% Call app
app = sg_app(tg, model, sigs, pars)
