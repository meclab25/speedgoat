clear; close all; clc;
Ts = 1e-3;
time = 0;
udpSingleStructures; % call tx and rx structures
[rxData1, rxData2, rxData3, rxData4, rxData5] = rx2data(rx);

sig1 = timeseries(rxData1, time);
sig2 = timeseries(rxData2, time);
sig3 = timeseries(rxData3, time);
sig_u1 = timeseries(rxData4(1), time);
sig_u2 = timeseries(rxData4(2), time);
sig_u3 = timeseries(rxData4(3), time);
sig_Dw = timeseries(rxData5, time);

model = 'sg';
open_system(model);
%% Initial values
modelWorkspaceParameters;
modelWS = get_param(model, 'ModelWorkspace');
modelWSList = whos(modelWS);
for i = 1:numel(modelWSList)
    name = modelWSList(i).name;
    assignin(modelWS, name, pars.(name));
end
%% To look at the model-workspace variables, use
% getVariable(modelWS, varName);

%% Apply signal on input
ds = createInputDataset(model);
ds{1} = sig1;
ds{2} = sig2;
ds{3} = sig3;
ds{4} = sig_u1;
ds{5} = sig_u2;
ds{6} = sig_u3;
ds{7} = sig_Dw;
set_param(model,'LoadExternalInput','on');
set_param(model,'ExternalInput','ds');
%% Add IP address and mark signals
cxIP = '192.168.90.50';     % local  - 192.168.90.50
cxPort = '50050';           % local  - 50050
sgIP = '192.168.90.60';     % remote - 192.168.90.60
sgPort = '50060';           % remote - 50060

set_param(model,'RTWVerbose','off');
set_param(model,'StopTime','10');
set_param([model,'/UDP Send'],'toAddress',cxIP);
set_param([model, '/UDP Send'], 'toPort', cxPort);
set_param([model,'/UDP Receive'],'ipAddress',sgIP);
set_param([model,'/UDP Receive'],'fmAddress',cxIP);
set_param([model, '/UDP Receive'], 'localPort', sgPort);

handle1 = get_param([model, '/Concat1'], 'PortHandles');
handle2 = get_param([model, '/Concat2'],'PortHandles');
handle3 = get_param([model, '/Controller'], 'PortHandles');
handle4 = get_param([model, '/Gain4'], 'PortHandles');
handle5 = get_param([model, '/ByteUnpackBlock'], 'PortHandles');
handle6 = get_param([model, '/Controller/qref'], 'PortHandles');
handle7 = get_param([model, '/Controller/controlMode'], 'PortHandles');

Outport1 = handle1.Outport;
Outport2 = handle2.Outport;
Outport3 = handle3.Outport;
Outport4 = handle4.Outport;
Outport5 = handle5.Outport;
Outport6 = handle6.Outport;
Outport7 = handle7.Outport;


Simulink.sdi.markSignalForStreaming(Outport1, 'on');
Simulink.sdi.markSignalForStreaming(Outport2, 'on');
Simulink.sdi.markSignalForStreaming(Outport3(4), 'on');
Simulink.sdi.markSignalForStreaming(Outport4, 'on');
Simulink.sdi.markSignalForStreaming(Outport5(1), 'on');
Simulink.sdi.markSignalForStreaming(Outport5(2), 'on');
Simulink.sdi.markSignalForStreaming(Outport5(3), 'on');
Simulink.sdi.markSignalForStreaming(Outport5(4), 'on');
Simulink.sdi.markSignalForStreaming(Outport6, 'on');
Simulink.sdi.markSignalForStreaming(Outport7, 'on');

%% Save
save_system(model);
%% Build
evalc('slbuild(model)');
bdclose(model);

