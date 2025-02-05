classdef sg_app < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        MessageLabel               matlab.ui.control.Label
        ClosedloopPIDparametersforComaujointsq1q2q3Label_3  matlab.ui.control.Label
        Image                      matlab.ui.control.Image
        SDIviewDropDown            matlab.ui.control.DropDown
        SDIviewDropDownLabel       matlab.ui.control.Label
        ControlmodestateLabel      matlab.ui.control.Label
        ClosedloopPIDparametersforComaujointsq1q2q3Label_2  matlab.ui.control.Label
        JointmeasurementsdegLabel  matlab.ui.control.Label
        JointreferencesdegLabel    matlab.ui.control.Label
        StoptimesetableLabel       matlab.ui.control.Label
        ExecutiontimeLabel         matlab.ui.control.Label
        ClosedloopPIDparametersforComaujointsq1q2q3Label  matlab.ui.control.Label
        StatusBar                  slrealtime.ui.control.StatusBar
        StopButton                 matlab.ui.control.Button
        StartButton                matlab.ui.control.Button
        ControlmodeLabel           matlab.ui.control.Label
        LoadRefButton              matlab.ui.control.Button
        q3Label                    matlab.ui.control.Label
        q2Label                    matlab.ui.control.Label
        q1Label                    matlab.ui.control.Label
        LoadedLamp                 matlab.ui.control.Lamp
        LoadedLampLabel            matlab.ui.control.Label
        SaveParametersButton       matlab.ui.control.Button
        SatWEditField              matlab.ui.control.NumericEditField
        SatWEditFieldLabel         matlab.ui.control.Label
        SatU3EditField             matlab.ui.control.NumericEditField
        SatU3EditFieldLabel        matlab.ui.control.Label
        SatU2EditField             matlab.ui.control.NumericEditField
        SatU2EditFieldLabel        matlab.ui.control.Label
        SatU1EditField             matlab.ui.control.NumericEditField
        SatU1EditFieldLabel        matlab.ui.control.Label
        FWEditField                matlab.ui.control.NumericEditField
        FWEditFieldLabel           matlab.ui.control.Label
        AWEditField                matlab.ui.control.NumericEditField
        AWEditFieldLabel           matlab.ui.control.Label
        ActivateWButton            matlab.ui.control.Button
        WSlider                    matlab.ui.control.Slider
        WSliderLabel               matlab.ui.control.Label
        ControlModeDropDown        matlab.ui.control.DropDown
        ControlModeDropDownLabel   matlab.ui.control.Label
        q3EditField                matlab.ui.control.NumericEditField
        q3EditFieldLabel           matlab.ui.control.Label
        q2EditField                matlab.ui.control.NumericEditField
        q2EditFieldLabel           matlab.ui.control.Label
        q1EditField                matlab.ui.control.NumericEditField
        q1EditFieldLabel           matlab.ui.control.Label
        KD3EditField               matlab.ui.control.NumericEditField
        KD3EditFieldLabel          matlab.ui.control.Label
        KI3EditField               matlab.ui.control.NumericEditField
        KI3EditFieldLabel          matlab.ui.control.Label
        KP3EditField               matlab.ui.control.NumericEditField
        KP3EditFieldLabel          matlab.ui.control.Label
        KD2EditField               matlab.ui.control.NumericEditField
        KD2EditFieldLabel          matlab.ui.control.Label
        KI2EditField               matlab.ui.control.NumericEditField
        KI2EditFieldLabel          matlab.ui.control.Label
        KP2EditField               matlab.ui.control.NumericEditField
        KP2EditFieldLabel          matlab.ui.control.Label
        KD1EditField               matlab.ui.control.NumericEditField
        KD1EditFieldLabel          matlab.ui.control.Label
        KI1EditField               matlab.ui.control.NumericEditField
        KI1EditFieldLabel          matlab.ui.control.Label
        KP1EditField               matlab.ui.control.NumericEditField
        KP1EditFieldLabel          matlab.ui.control.Label
        StopTimeEditField          slrealtime.ui.control.StopTimeEditField
        SimulationTimeEditField    slrealtime.ui.control.SimulationTimeEditField
        ConnectButton              slrealtime.ui.control.ConnectButton
        ZeroRefButton              matlab.ui.control.Button
        ActivateU3Button           matlab.ui.control.Button
        ActivateU2Button           matlab.ui.control.Button
        ActivateU1Button           matlab.ui.control.Button
        U3Slider                   matlab.ui.control.Slider
        U3SliderLabel              matlab.ui.control.Label
        U2Slider                   matlab.ui.control.Slider
        U2SliderLabel              matlab.ui.control.Label
        U1Slider                   matlab.ui.control.Slider
        U1SliderLabel              matlab.ui.control.Label
        FU3EditField               matlab.ui.control.NumericEditField
        FU3EditFieldLabel          matlab.ui.control.Label
        FU2EditField               matlab.ui.control.NumericEditField
        FU2EditFieldLabel          matlab.ui.control.Label
        FU1EditField               matlab.ui.control.NumericEditField
        FU1EditFieldLabel          matlab.ui.control.Label
        AU3EditField               matlab.ui.control.NumericEditField
        AU3EditFieldLabel          matlab.ui.control.Label
        AU2EditField               matlab.ui.control.NumericEditField
        AU2EditFieldLabel          matlab.ui.control.Label
        AU1EditField               matlab.ui.control.NumericEditField
        AU1EditFieldLabel          matlab.ui.control.Label
    end


    properties (Access = public)
        tg;                 % speedgoat
        model;              % model name
        modelWS;            % model workspace
        sigs;               % signal structure (for stimulation)
        KP1 (1, 1) single;  % PID 1
        KI1 (1, 1) single;
        KD1 (1, 1) single;
        N1  (1, 1) single;
        KP2 (1, 1) single;
        KI2 (1, 1) single;
        KD2 (1, 1) single;
        N2  (1, 1) single;
        KP3 (1, 1) single;
        KI3 (1, 1) single;
        KD3 (1, 1) single;
        N3  (1, 1) single;

        SatU1 (1, 1) single;
        SatU2 (1, 1) single;
        SatU3 (1, 1) single;
        SatW (1, 1) single;               % control output saturation values

        GainU1 (1, 1) single;             % for slider U1
        GainU2 (1, 1) single;             % for slider U2
        GainU3 (1, 1) single;             % for slider U3
        GainW  (1, 1) single;             % slider not implemented yet
        controlMode (1, 1) double;        % controlMode = {0, 1, 2, 3} (def, open, closed, sines)
        qref (3, 1) double;               % reference joint angles for closed-loop

        AU1 (1, 1) double;
        AU2 (1, 1) double;
        AU3 (1, 1) double;
        AW  (1, 1) double;
        FU1 (1, 1) double;
        FU2 (1, 1) double;
        FU3 (1, 1) double;
        FW  (1, 1) double;

        Tf;
        messageFlag (1, 1) = false;        % For the "update parameters" state.
        message;
        loadedFlag (1, 1) = false;
        listDoubles;
        listSingles;
        listSpecial;
        runID;
        runTimer;
        parsCopy;
    end

    properties (Access = private)
        U1SliderFlag = false;
        U2SliderFlag = false;
        U3SliderFlag = false;
        WSliderFlag = false;
        stopTimer;
    end

    methods (Access = private)

        function timerFunc(app, ~, ~)
            if(strcmp(status(app.tg), 'running'))
                app.runID = app.tg.SDIRunId;
                run = Simulink.sdi.getRun(app.runID);
                qs = getSignalsByName(run, 'comau_q');
                app.q1Label.Text = ['$q_1=$', num2str(qs.Values.Data(end,1)*180/pi, 4), ' ', '$^{\circ}$'];
                app.q2Label.Text = ['$q_2=$', num2str(qs.Values.Data(end,2)*180/pi, 4), ' ', '$^{\circ}$'];
                app.q3Label.Text = ['$q_3=$', num2str(qs.Values.Data(end,3)*180/pi, 4), ' ', '$^{\circ}$'];
                app.MessageLabel.Text = "";
                app.MessageLabel.FontColor = "black";
                app.ControlmodeLabel.Text = num2str(app.controlMode);
                app.LoadedLamp.Enable = false;
            elseif(strcmp(status(app.tg), 'loaded'))
                stop(app.runTimer)
                app.LoadedLamp.Enable = true;
                delete(app.runTimer);
                app.runTimer = [];
            end
        end
        function stopTimerFunc(app, ~, ~)
            if (strcmp(status(app.tg), 'loaded'))
                app.U1SliderFlag = 0;
                app.U2SliderFlag = 0;
                app.U3SliderFlag = 0;
                app.WSliderFlag = 0;
                app.ActivateU1Button.BackgroundColor = [0.96, 0.96, 0.96];
                app.ActivateU2Button.BackgroundColor = [0.96, 0.96, 0.96];
                app.ActivateU3Button.BackgroundColor = [0.96, 0.96, 0.96];
                app.ActivateWButton.BackgroundColor = [0.96, 0.96, 0.96];
                app.GainU1 = 1;
                app.GainU2 = 1;
                app.GainU3 = 1;
                app.GainW = 1;
                app.tg.setparam('', 'GainU1', single(app.GainU1));
                app.tg.setparam('', 'GainU2', single(app.GainU2));
                app.tg.setparam('', 'GainU3', single(app.GainU3));
                app.tg.setparam('', 'GainW', single(app.GainW));
                app.MessageLabel.Text = "";
                app.MessageLabel.FontColor = "black";
                stop(app.stopTimer);
                delete(app.stopTimer);
                app.stopTimer = [];
            end

        end

        function writeGainU1(app, value)
            disp(['Updating GainU1 to ', num2str(value)]);
            app.tg.setparam('', 'GainU1', single(value));
            app.MessageLabel.Text = "message";
            app.MessageLabel.FontColor = "blue";
        end
        function writeGainU2(app, value)
            disp(['Updating GainU2 to ', num2str(value)]);
            app.tg.setparam('', 'GainU2', single(value));
            app.MessageLabel.Text = "message";
            app.MessageLabel.FontColor = "blue";
        end
        function writeGainU3(app, value)
            disp(['Updating GainU3 to ', num2str(value)]);
            app.tg.setparam('', 'GainU3', single(value));
            app.MessageLabel.Text = "message";
            app.MessageLabel.FontColor = "blue";
        end
        function writeGainW(app, value)
            app.tg.setparam('', 'GainW', single(value));
        end
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, tg, model, sigs, pars)
            app.tg = tg;
            app.model = model;
            app.sigs = sigs;
            app.parsCopy = pars;
            app.listDoubles = {'AU1', 'AU2', 'AU3', ...
                'FU1', 'FU2', 'FU3', 'AW', 'FW'};
            app.listSingles = {'KP1', 'KP2', 'KP3', ...
                'KI1', 'KI2', 'KI3', 'KD1', 'KD2', 'KD3',...
                'SatU1', 'SatU2', 'SatU3', 'SatW'};
            % Special cases are shown in deg in GUI
            app.listSpecial = {'AU1', 'AU2', 'AU3', 'SatU1', 'SatU2', 'SatU3'};
            for i = 1:numel(app.listDoubles)
                app.(app.listDoubles{i}) = pars.(app.listDoubles{i});
                if ismember(app.listDoubles{i}, app.listSpecial)
                    app.([app.listDoubles{i}, 'EditField']).Value = pars.(app.listDoubles{i})*180/pi;
                else
                    app.([app.listDoubles{i}, 'EditField']).Value = pars.(app.listDoubles{i});
                end
            end
            for i = 1:numel(app.listSingles)
                app.(app.listSingles{i}) = pars.(app.listSingles{i});
                if ismember(app.listSingles{i}, app.listSpecial)
                    app.([app.listSingles{i}, 'EditField']).Value = double((pars.(app.listSingles{i}))*180/pi);
                else
                    app.([app.listSingles{i}, 'EditField']).Value = double(pars.(app.listSingles{i}));
                end
            end
            app.qref = double(pars.qref);
            app.q1EditField.Value = double(pars.qref(1)*180/pi);
            app.q2EditField.Value = double(pars.qref(2)*180/pi);
            app.q3EditField.Value = double(pars.qref(3)*180/pi);
            app.ControlmodeLabel.Text = num2str(app.controlMode);
            app.q1Label.Interpreter = 'latex';
            app.q2Label.Interpreter = 'latex';
            app.q3Label.Interpreter = 'latex';
            app.q1Label.Text = ['$q_1 = ?$'];
            app.q2Label.Text = ['$q_2 = ?$'];
            app.q3Label.Text = ['$q_3 = ?$'];

            tg.Stimulation.stop([4, 5, 6, 7]);
            tg.Stimulation.reloadData(4, sigs.u1, 5, sigs.u2, 6, sigs.u3, 7, sigs.w);
            tg.Stimulation.start([4,5,6,7]);
            app.controlMode = 0;
            if (strcmp(status(app.tg), 'loaded'))
                app.loadedFlag = 1;
                app.LoadedLamp.Enable = app.loadedFlag;
            end
            app.runID = tg.SDIRunId;


        end

        % Value changed function: AU1EditField
        function AU1EditFieldValueChanged(app, event)
            app.AU1 = app.AU1EditField.Value*pi/180;
            app.tg.setparam('', 'AU1', app.AU1);

        end

        % Value changed function: AU2EditField
        function AU2EditFieldValueChanged(app, event)
            app.AU2 = app.AU2EditField.Value*pi/180;
            app.tg.setparam('', 'AU2', double(app.AU2));

        end

        % Value changed function: AU3EditField
        function AU3EditFieldValueChanged(app, event)
            app.AU3 = app.AU3EditField*pi/180;
            app.tg.setparam('', 'AU3', app.AU3);

        end

        % Value changed function: FU1EditField
        function FU1EditFieldValueChanged(app, event)
            app.FU1 = app.FU1EditField.Value;
            app.tg.setparam('', 'FU1', app.FU1);

        end

        % Value changed function: FU2EditField
        function FU2EditFieldValueChanged(app, event)
            app.FU2 = app.FU2EditField.Value;
            app.tg.setparam('', 'FU2', app.FU2);

        end

        % Value changed function: FU3EditField
        function FU3EditFieldValueChanged(app, event)
            app.FU3 = app.FU3EditField.Value;
            app.tg.setparam('', 'FU3', app.FU3);

        end

        % Value changed function: KP1EditField
        function KP1EditFieldValueChanged(app, event)
            app.KP1 = app.KP1EditField.Value;
            app.tg.setparam('', 'KP1', single(app.KP1));

        end

        % Value changed function: KI1EditField
        function KI1EditFieldValueChanged(app, event)
            app.KI1 = app.KI1EditField.Value;
            app.tg.setparam('', 'KI1', single(app.KI1));

        end

        % Value changed function: KD1EditField
        function KD1EditFieldValueChanged(app, event)
            app.KD1 = app.KD1EditField.Value;
            app.tg.setparam('', 'KD1', single(app.KD1));

        end

        % Value changed function: KP2EditField
        function KP2EditFieldValueChanged(app, event)
            app.KP2 = app.KP2EditField.Value;
            app.tg.setparam('', 'KP2', single(app.KP2));

        end

        % Value changed function: KI2EditField
        function KI2EditFieldValueChanged(app, event)
            app.KI2 = app.KI2EditField.Value;
            app.tg.setparam('', 'KI2', single(app.KI2));

        end

        % Value changed function: KD2EditField
        function KD2EditFieldValueChanged(app, event)
            app.KD2 = app.KD2EditField.Value;
            app.tg.setparam('', 'KD2', single(app.KD2));

        end

        % Value changed function: KP3EditField
        function KP3EditFieldValueChanged(app, event)
            app.KP3 = app.KP3EditField.Value;
            app.tg.setparam('', 'KP3', single(app.KP3));

        end

        % Value changed function: KI3EditField
        function KI3EditFieldValueChanged(app, event)
            app.KI3 = app.KI3EditField.Value;
            app.tg.setparam('', 'KI3', single(app.KI3));

        end

        % Value changed function: KD3EditField
        function KD3EditFieldValueChanged(app, event)
            app.KD3 = app.KD3EditField.Value;
            app.tg.setparam('', 'KD3', single(app.KD3));
        end

        % Value changed function: q1EditField
        function q1EditFieldValueChanged(app, event)
            app.qref(1) = single(app.q1EditField.Value*pi/180);
            warning("Load references while idle");
            app.MessageLabel.Text = "warning";
            app.MessageLabel.FontColor = "red";

        end

        % Value changed function: q2EditField
        function q2EditFieldValueChanged(app, event)
            app.qref(2) = single(app.q2EditField.Value*pi/180);
            warning("Load references while idle");
            app.MessageLabel.Text = "warning";
            app.MessageLabel.FontColor = "red";
        end

        % Value changed function: q3EditField
        function q3EditFieldValueChanged(app, event)
            app.qref(3) = single(app.q3EditField.Value*pi/180);
            warning("Load references while idle");
            app.MessageLabel.Text = "warning";
            app.MessageLabel.FontColor = "red";

        end

        % Button pushed function: ActivateU1Button
        function ActivateU1ButtonPushed(app, event)
            if (strcmp(status(app.tg), 'loaded'))
                if app.controlMode == 1
                    if ~app.U1SliderFlag
                        app.tg.setparam('', 'GainU1', single(0));
                        app.tg.Stimulation.stop([4]);
                        app.tg.Stimulation.reloadData(4, timeseries(single(1), 0));
                        app.tg.Stimulation.start([4]);
                        app.U1SliderFlag = true;
                        app.ActivateU1Button.BackgroundColor = [0.8, 0.96, 0.8];
                        app.U1Slider.Limits = [-double(app.SatU1), double(app.SatU1)];
                        app.U1Slider.MajorTicks = -double(app.SatU1):double(app.SatU1/4):double(app.SatU1);
                    else
                        app.tg.Stimulation.stop([4]);
                        app.tg.Stimulation.reloadData(4, timeseries(single(0), 0));
                        app.tg.Stimulation.start([4]);
                        app.tg.setparam('', 'GainU1', single(1));
                        app.ActivateU1Button.BackgroundColor = [0.96, 0.96, 0.96];
                        app.U1SliderFlag = false;
                    end
                else
                    warning("Sliders work only in open loop");
                    app.MessageLabel.Text = "warning";
                    app.MessageLabel.FontColor = "red";
                end
            else
                warning("Cannot activate while running");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end

        end

        % Button pushed function: ActivateU2Button
        function ActivateU2ButtonPushed(app, event)
            if (strcmp(status(app.tg), 'loaded'))
                if app.controlMode == 1
                    if ~app.U2SliderFlag
                        app.tg.setparam('', 'GainU2', single(0));
                        app.tg.Stimulation.stop([5]);
                        app.tg.Stimulation.reloadData(5, timeseries(single(1), 0));
                        app.tg.Stimulation.start([5]);
                        app.U2SliderFlag = true;
                        app.ActivateU2Button.BackgroundColor = [0.8, 0.96, 0.8];
                        app.U2Slider.Limits = [-double(app.SatU2), double(app.SatU2)];
                        app.U2Slider.MajorTicks = -double(app.SatU2):double(app.SatU2/4):double(app.SatU2);
                    else
                        app.tg.Stimulation.stop([5]);
                        app.tg.Stimulation.reloadData(5, timeseries(single(0), 0));
                        app.tg.Stimulation.start([5]);
                        app.tg.setparam('', 'GainU2', single(1));
                        app.ActivateU2Button.BackgroundColor = [0.96, 0.96, 0.96];
                        app.U2SliderFlag = false;
                    end
                else
                    warning("Sliders work only in open loop");
                    app.MessageLabel.Text = "warning";
                    app.MessageLabel.FontColor = "red";
                end
            else
                warning("Cannot activate while running");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end
        end

        % Button pushed function: ActivateU3Button
        function ActivateU3ButtonPushed(app, event)
            if (strcmp(status(app.tg), 'loaded'))
                if app.controlMode == 1
                    if ~app.U3SliderFlag
                        app.tg.setparam('', 'GainU3', single(0));
                        app.tg.Stimulation.stop([6]);
                        app.tg.Stimulation.reloadData(6, timeseries(single(1), 0));
                        app.tg.Stimulation.start([6]);
                        app.U3SliderFlag = true;
                        app.ActivateU3Button.BackgroundColor = [0.8, 0.96, 0.8];
                        app.U3Slider.Limits = [-double(app.SatU3), double(app.SatU3)];
                        app.U3Slider.MajorTicks = -double(app.SatU3):double(app.SatU3/4):double(app.SatU3);
                    else
                        app.tg.Stimulation.stop([6]);
                        app.tg.Stimulation.reloadData(6, timeseries(single(0), 0));
                        app.tg.Stimulation.start([6]);
                        app.tg.setparam('', 'GainU3', single(1));
                        app.ActivateU3Button.BackgroundColor = [0.96, 0.96, 0.96];
                        app.U3SliderFlag = false;
                    end
                else
                    warning("Sliders work only in open loop");
                    app.MessageLabel.Text = "warning";
                    app.MessageLabel.FontColor = "red";
                end
            else
                warning("Cannot activate while running");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end
        end

        % Button pushed function: ActivateWButton
        function ActivateWButtonPushed(app, event)
            if (strcmp(status(app.tg), 'loaded'))
                if app.controlMode == 1
                    if ~app.WSliderFlag
                        app.tg.setparam('', 'GainW', single(0));
                        app.tg.Stimulation.stop([7]);
                        app.tg.Stimulation.reloadData(7, timeseries(single(1), 0));
                        app.tg.Stimulation.start([7]);
                        app.WSliderFlag = true;
                        app.ActivateWButton.BackgroundColor = [0.8, 0.96, 0.8];
                        app.WSlider.Limits = [-double(app.SatW), double(app.SatW)];
                        app.WSlider.MajorTicks = -double(app.SatW):double(app.SatW/4):double(app.SatW);
                    else
                        app.tg.setparam('', 'GainW', single(1));
                        app.ActivateWButton.BackgroundColor = [0.96, 0.96, 0.96];
                        app.WSliderFlag = false;
                    end
                else
                    warning("Sliders work only in open loop");
                    app.MessageLabel.Text = "warning";
                    app.MessageLabel.FontColor = "red";
                end
            else
                warning("Cannot activate while running");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end
        end

        % Value changing function: U1Slider
        function U1SliderValueChanging(app, event)
            if(app.U1SliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainU1', single(event.Value));
            end
        end

        % Value changing function: U2Slider
        function U2SliderValueChanging(app, event)
            if(app.U2SliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainU2', single(event.Value));
            end

        end

        % Value changing function: U3Slider
        function U3SliderValueChanging(app, event)
            if(app.U3SliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainU3', single(event.Value));
            end

        end

        % Value changing function: WSlider
        function WSliderValueChanging(app, event)
            if(app.WSliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainW', single(event.Value));
            end

        end

        % Button pushed function: ZeroRefButton
        function ZeroRefButtonPushed(app, event)
            app.tg.setparam('', 'controlMode', 0);
            app.controlMode = 0;
            app.ControlModeDropDown.Value = 'Zero-ref';
            if (strcmp(status(app.tg), 'loaded') || strcmp(status(app.tg), 'running'))
                app.tg.Stimulation.stop([4,5,6,7]);
                zts = timeseries(single(0), 0);
                app.tg.Stimulation.reloadData(4,zts,5,zts,6,zts,7,zts);
                app.tg.Stimulation.start([4,5,6,7]);
            end
        end

        % Value changed function: ControlModeDropDown
        function ControlModeDropDownValueChanged(app, event)
            if (strcmp(status(app.tg), 'loaded'))
                value = app.ControlModeDropDown.Value;
                switch value
                    case 'Open loop'
                        app.controlMode = 1;
                    case 'Closed loop'
                        app.controlMode = 2;
                        app.tg.setparam('', 'qref', single(app.qref));
                        app.tg.setStopTime(inf);
                        app.tg.Stimulation.stop([4,5,6,7]);
                        zts = timeseries(single(0), 0);
                        app.tg.Stimulation.reloadData(4, zts, 5, zts, 6, zts, 7, zts);
                        app.tg.Stimulation.start([4,5,6,7]);
                    case 'Sines'
                        app.controlMode = 3;
                        app.tg.setStopTime(inf);
                        app.tg.Stimulation.stop([4,5,6,7]);
                        zts = timeseries(single(0), 0);
                        app.tg.Stimulation.reloadData(4, zts, 5, zts, 6, zts, 7, zts);
                        app.tg.Stimulation.start([4,5,6,7]);
                    otherwise
                        app.controlMode = 0;
                end
                app.tg.setparam('', 'controlMode', app.controlMode);
            else
            switch app.controlMode
                case 1 
                    app.ControlModeDropDown.Value = 'Open loop';
                case 2
                    app.ControlModeDropDown.Value = 'Closed loop';
                case 3
                    app.ControlModeDropDown.Value = 'Sines';
                otherwise
                    app.ControlModeDropDown.Value = 'Zero-ref';
            end
                warning("Cannot change control-mode while running");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end

        end

        % Value changed function: AWEditField
        function AWEditFieldValueChanged(app, event)
            app.AW = app.AWEditField.Value;
            app.tg.setparam('', 'AW', single(app.AW));

        end

        % Value changed function: FWEditField
        function FWEditFieldValueChanged(app, event)
            app.FW = app.FWEditField.Value;
            app.tg.setparam('', 'FW', single(app.FW));

        end

        % Button pushed function: SaveParametersButton
        function SaveParametersButtonPushed(app, event)
            app.parsCopy.AU1 = app.AU1;
            app.parsCopy.AU2 = app.AU2;
            app.parsCopy.AU3 = app.AU3;
            app.parsCopy.FU1 = app.FU1;
            app.parsCopy.FU2 = app.FU2;
            app.parsCopy.FU3 = app.FU3;
            app.parsCopy.AW = app.AW;
            app.parsCopy.FW = app.FW;
            app.parsCopy.SatU1 = single(app.SatU1);
            app.parsCopy.SatU2 = single(app.SatU2);
            app.parsCopy.SatU3 = single(app.SatU3);
            app.parsCopy.SatW = single(app.SatW);
            app.parsCopy.KP1 = single(app.KP1);
            app.parsCopy.KP2 = single(app.KP2);
            app.parsCopy.KP3 = single(app.KP3);
            app.parsCopy.KI1 = single(app.KI1);
            app.parsCopy.KI2 = single(app.KI2);
            app.parsCopy.KI3 = single(app.KI3);
            app.parsCopy.KD1 = single(app.KD1);
            app.parsCopy.KD2 = single(app.KD2);
            app.parsCopy.KD3 = single(app.KD3);
            app.parsCopy.qref = single(app.qref);
            pars = app.parsCopy;
            assignin('base', 'pars', pars);
            save('pars.mat', 'pars');
        end

        % Button pushed function: LoadRefButton
        function LoadRefButtonPushed(app, event)
            if strcmp(status(app.tg), 'loaded')
                if app.controlMode == 1
                    buffer = 100; % final 10 values should be zero
                    temp = evalin('base', 'sigs');
                    if (isa(temp.u1.Data, 'single') && ...
                            isa(temp.u2.Data, 'single') && ...
                            isa(temp.u3.Data, 'single') && ...
                            isa(temp.w.Data, 'single'))
                        app.sigs = temp;
                        app.Tf = app.sigs.u1.Time(end);
                        app.tg.setStopTime(app.Tf);
                        app.sigs.u1.Data(end-buffer:end) = 0;
                        app.sigs.u2.Data(end-buffer:end) = 0;
                        app.sigs.u3.Data(end-buffer:end) = 0;
                        app.sigs.w.Data(end-buffer:end) = 0;
                        app.tg.Stimulation.stop([4,5,6,7]);
                        app.tg.Stimulation.reloadData(4, app.sigs.u1, 5, app.sigs.u2, 6, app.sigs.u3, 7, app.sigs.w);
                        app.tg.Stimulation.start([4,5,6,7]);
                        disp("Sucessfully fetched sigs from base workspace");
                        app.MessageLabel.Text = "message";
                        app.MessageLabel.FontColor = "blue";
                    else
                        warning("Signal data not singles");
                        app.MessageLabel.Text = "warning";
                        app.MessageLabel.FontColor = "red";
                    end
                elseif app.controlMode == 2
                    app.tg.setparam('', 'qref', single(app.qref));
                    disp("Successfully loaded qref");
                    app.MessageLabel.Text = "message";
                    app.MessageLabel.FontColor = "blue";
                elseif app.controlMode == 3
                    app.tg.Stimulation.stop([4,5,6,7]);
                    zts = timeseries(single(0), 0);
                    app.tg.Stimulation.reloadData(4, zts, 5, zts, 6, zts, 7, zts);
                    app.tg.Stimulation.start([4,5,6,7]);
                else
                    warning("control mode not set properly");
                    app.MessageLabel.Text = "warning";
                    app.MessageLabel.FontColor = "red";
                end
            else
                warning("Cannot load references while running");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end

        end

        % Button pushed function: StartButton
        function StartButtonPushed(app, event)
            if (strcmp(status(app.tg), 'loaded'))
                for i = 1:numel(app.listDoubles)
                    app.tg.setparam('', app.listDoubles{i}, double(app.(app.listDoubles{i})));
                end
                for i = 1:numel(app.listSingles)
                    app.tg.setparam('', app.listSingles{i}, single(app.(app.listSingles{i})));
                end
                app.tg.setparam('', 'controlMode', app.controlMode);
                app.tg.start('ReloadOnStop', true);
                app.runTimer = timer("Period", 0.5, "ExecutionMode", "fixedSpacing", ...
                "TimerFcn", @(~, ~) app.timerFunc());
                start(app.runTimer);
            else
                warning("Start should only be pressed in loded state");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end


        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, event)
            if (strcmp(status(app.tg), 'running'))
                app.controlMode = 0;
                app.tg.setparam('', 'controlMode', app.controlMode);
                disp("stopped");
                app.MessageLabel.Text = "message";
                app.MessageLabel.FontColor = "blue";
                app.ControlModeDropDown.Value = 'Zero-ref';
                app.tg.stop;
                app.stopTimer = timer("Period", 0.5, ...
                    "ExecutionMode", "fixedDelay", ...
                    "TimerFcn", @(~, ~) app.stopTimerFunc());
                start(app.stopTimer);
            else
                warning("Stop shold only be pressed in running state");
                app.MessageLabel.Text = "warning";
                app.MessageLabel.FontColor = "red";
            end
        end

        % Value changed function: SatU1EditField
        function SatU1EditFieldValueChanged(app, event)
            app.SatU1 = app.SatU1EditField.Value*pi/180;
            app.tg.setparam('', 'SatU1', single(app.SatU1));

        end

        % Value changed function: SatU2EditField
        function SatU2EditFieldValueChanged(app, event)
            app.SatU2 = app.SatU2EditField.Value*pi/180;
            app.tg.setparam('', 'SatU2', single(app.SatU2));

        end

        % Value changed function: SatU3EditField
        function SatU3EditFieldValueChanged(app, event)
            app.SatU3 = app.SatU3EditField.Value*pi/180;
            app.tg.setparam('', 'SatU3', single(app.SatU3));

        end

        % Value changed function: SatWEditField
        function SatWEditFieldValueChanged(app, event)
            app.SatW = app.SatWEditField.Value;
            app.tg.setparam('', 'SatW', single(app.SatW));

        end

        % Value changed function: U1Slider
        function U1SliderValueChanged(app, event)
            app.U1Slider.Value = 0;
            if (app.U1SliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainU1', single(0));
            end

        end

        % Value changed function: U2Slider
        function U2SliderValueChanged(app, event)
            app.U2Slider.Value = 0;
            if (app.U2SliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainU2', single(0));
            end

        end

        % Value changed function: U3Slider
        function U3SliderValueChanged(app, event)
            app.U3Slider.Value = 0;
            if (app.U3SliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainU3', single(0));
            end

        end

        % Value changed function: WSlider
        function WSliderValueChanged(app, event)
            app.WSlider.Value = 0;
            if (app.WSliderFlag && strcmp(status(app.tg), 'running'))
                app.tg.setparam('', 'GainW', single(0));
            end

        end

        % Value changed function: SDIviewDropDown
        function SDIviewDropDownValueChanged(app, event)
            value = app.SDIviewDropDown.Value;
            switch value
                case 'comau (ref,u)'
                    Simulink.sdi.loadView('sdi-comau-ref-u');
                case 'comau-sines'
                    Simulink.sdi.loadView('sdi-sines');
                case 'open-loop'
                    Simulink.sdi.loadView('sdi-open-loop');
                case 'closed-loop'
                    Simulink.sdi.loadView('sdi-closed-loop');
                otherwise
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 865 726];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Resize = 'off';

            % Create AU1EditFieldLabel
            app.AU1EditFieldLabel = uilabel(app.UIFigure);
            app.AU1EditFieldLabel.HorizontalAlignment = 'right';
            app.AU1EditFieldLabel.FontName = 'InconsolataGo';
            app.AU1EditFieldLabel.FontSize = 14;
            app.AU1EditFieldLabel.Position = [31 654 32 22];
            app.AU1EditFieldLabel.Text = 'AU1';

            % Create AU1EditField
            app.AU1EditField = uieditfield(app.UIFigure, 'numeric');
            app.AU1EditField.ValueChangedFcn = createCallbackFcn(app, @AU1EditFieldValueChanged, true);
            app.AU1EditField.Position = [72 654 63 22];

            % Create AU2EditFieldLabel
            app.AU2EditFieldLabel = uilabel(app.UIFigure);
            app.AU2EditFieldLabel.HorizontalAlignment = 'right';
            app.AU2EditFieldLabel.FontName = 'InconsolataGo';
            app.AU2EditFieldLabel.FontSize = 14;
            app.AU2EditFieldLabel.Position = [157 654 33 22];
            app.AU2EditFieldLabel.Text = 'AU2';

            % Create AU2EditField
            app.AU2EditField = uieditfield(app.UIFigure, 'numeric');
            app.AU2EditField.ValueChangedFcn = createCallbackFcn(app, @AU2EditFieldValueChanged, true);
            app.AU2EditField.Position = [198 654 63 22];

            % Create AU3EditFieldLabel
            app.AU3EditFieldLabel = uilabel(app.UIFigure);
            app.AU3EditFieldLabel.HorizontalAlignment = 'right';
            app.AU3EditFieldLabel.FontName = 'InconsolataGo';
            app.AU3EditFieldLabel.FontSize = 14;
            app.AU3EditFieldLabel.Position = [283 653 32 22];
            app.AU3EditFieldLabel.Text = 'AU3';

            % Create AU3EditField
            app.AU3EditField = uieditfield(app.UIFigure, 'numeric');
            app.AU3EditField.ValueChangedFcn = createCallbackFcn(app, @AU3EditFieldValueChanged, true);
            app.AU3EditField.Position = [324 653 63 22];

            % Create FU1EditFieldLabel
            app.FU1EditFieldLabel = uilabel(app.UIFigure);
            app.FU1EditFieldLabel.HorizontalAlignment = 'right';
            app.FU1EditFieldLabel.FontName = 'InconsolataGo';
            app.FU1EditFieldLabel.FontSize = 14;
            app.FU1EditFieldLabel.Position = [31 621 33 22];
            app.FU1EditFieldLabel.Text = 'FU1';

            % Create FU1EditField
            app.FU1EditField = uieditfield(app.UIFigure, 'numeric');
            app.FU1EditField.ValueChangedFcn = createCallbackFcn(app, @FU1EditFieldValueChanged, true);
            app.FU1EditField.Position = [72 621 63 22];

            % Create FU2EditFieldLabel
            app.FU2EditFieldLabel = uilabel(app.UIFigure);
            app.FU2EditFieldLabel.HorizontalAlignment = 'right';
            app.FU2EditFieldLabel.FontName = 'InconsolataGo';
            app.FU2EditFieldLabel.FontSize = 14;
            app.FU2EditFieldLabel.Position = [157 621 33 22];
            app.FU2EditFieldLabel.Text = 'FU2';

            % Create FU2EditField
            app.FU2EditField = uieditfield(app.UIFigure, 'numeric');
            app.FU2EditField.ValueChangedFcn = createCallbackFcn(app, @FU2EditFieldValueChanged, true);
            app.FU2EditField.Position = [198 621 63 22];

            % Create FU3EditFieldLabel
            app.FU3EditFieldLabel = uilabel(app.UIFigure);
            app.FU3EditFieldLabel.HorizontalAlignment = 'right';
            app.FU3EditFieldLabel.FontName = 'InconsolataGo';
            app.FU3EditFieldLabel.FontSize = 14;
            app.FU3EditFieldLabel.Position = [283 621 32 22];
            app.FU3EditFieldLabel.Text = 'FU3';

            % Create FU3EditField
            app.FU3EditField = uieditfield(app.UIFigure, 'numeric');
            app.FU3EditField.ValueChangedFcn = createCallbackFcn(app, @FU3EditFieldValueChanged, true);
            app.FU3EditField.Position = [324 621 63 22];

            % Create U1SliderLabel
            app.U1SliderLabel = uilabel(app.UIFigure);
            app.U1SliderLabel.HorizontalAlignment = 'right';
            app.U1SliderLabel.Position = [38 443 25 22];
            app.U1SliderLabel.Text = 'U1';

            % Create U1Slider
            app.U1Slider = uislider(app.UIFigure);
            app.U1Slider.Limits = [-1 1];
            app.U1Slider.Orientation = 'vertical';
            app.U1Slider.ValueChangedFcn = createCallbackFcn(app, @U1SliderValueChanged, true);
            app.U1Slider.ValueChangingFcn = createCallbackFcn(app, @U1SliderValueChanging, true);
            app.U1Slider.BusyAction = 'cancel';
            app.U1Slider.Position = [84 452 3 150];

            % Create U2SliderLabel
            app.U2SliderLabel = uilabel(app.UIFigure);
            app.U2SliderLabel.HorizontalAlignment = 'right';
            app.U2SliderLabel.Position = [166 444 25 22];
            app.U2SliderLabel.Text = 'U2';

            % Create U2Slider
            app.U2Slider = uislider(app.UIFigure);
            app.U2Slider.Limits = [-1 1];
            app.U2Slider.Orientation = 'vertical';
            app.U2Slider.ValueChangedFcn = createCallbackFcn(app, @U2SliderValueChanged, true);
            app.U2Slider.ValueChangingFcn = createCallbackFcn(app, @U2SliderValueChanging, true);
            app.U2Slider.BusyAction = 'cancel';
            app.U2Slider.Position = [209 452 3 150];

            % Create U3SliderLabel
            app.U3SliderLabel = uilabel(app.UIFigure);
            app.U3SliderLabel.HorizontalAlignment = 'right';
            app.U3SliderLabel.Position = [290 443 25 22];
            app.U3SliderLabel.Text = 'U3';

            % Create U3Slider
            app.U3Slider = uislider(app.UIFigure);
            app.U3Slider.Limits = [-1 1];
            app.U3Slider.Orientation = 'vertical';
            app.U3Slider.ValueChangedFcn = createCallbackFcn(app, @U3SliderValueChanged, true);
            app.U3Slider.ValueChangingFcn = createCallbackFcn(app, @U3SliderValueChanging, true);
            app.U3Slider.BusyAction = 'cancel';
            app.U3Slider.Position = [336 452 3 150];

            % Create ActivateU1Button
            app.ActivateU1Button = uibutton(app.UIFigure, 'push');
            app.ActivateU1Button.ButtonPushedFcn = createCallbackFcn(app, @ActivateU1ButtonPushed, true);
            app.ActivateU1Button.Position = [33 406 100 22];
            app.ActivateU1Button.Text = 'Activate U1';

            % Create ActivateU2Button
            app.ActivateU2Button = uibutton(app.UIFigure, 'push');
            app.ActivateU2Button.ButtonPushedFcn = createCallbackFcn(app, @ActivateU2ButtonPushed, true);
            app.ActivateU2Button.Position = [159 406 100 22];
            app.ActivateU2Button.Text = 'Activate U2';

            % Create ActivateU3Button
            app.ActivateU3Button = uibutton(app.UIFigure, 'push');
            app.ActivateU3Button.ButtonPushedFcn = createCallbackFcn(app, @ActivateU3ButtonPushed, true);
            app.ActivateU3Button.Position = [285 406 100 22];
            app.ActivateU3Button.Text = 'Activate U3';

            % Create ZeroRefButton
            app.ZeroRefButton = uibutton(app.UIFigure, 'push');
            app.ZeroRefButton.ButtonPushedFcn = createCallbackFcn(app, @ZeroRefButtonPushed, true);
            app.ZeroRefButton.Position = [588 548 269 42];
            app.ZeroRefButton.Text = 'Zero Ref';

            % Create ConnectButton
            app.ConnectButton = slrealtime.ui.control.ConnectButton(app.UIFigure);
            app.ConnectButton.Position = [290 13 110 30];

            % Create SimulationTimeEditField
            app.SimulationTimeEditField = slrealtime.ui.control.SimulationTimeEditField(app.UIFigure);
            app.SimulationTimeEditField.Position = [25 258 90 20];

            % Create StopTimeEditField
            app.StopTimeEditField = slrealtime.ui.control.StopTimeEditField(app.UIFigure);
            app.StopTimeEditField.Position = [28 223 87 20];

            % Create KP1EditFieldLabel
            app.KP1EditFieldLabel = uilabel(app.UIFigure);
            app.KP1EditFieldLabel.HorizontalAlignment = 'right';
            app.KP1EditFieldLabel.FontName = 'InconsolataGo';
            app.KP1EditFieldLabel.Position = [21 135 25 22];
            app.KP1EditFieldLabel.Text = 'KP1';

            % Create KP1EditField
            app.KP1EditField = uieditfield(app.UIFigure, 'numeric');
            app.KP1EditField.ValueChangedFcn = createCallbackFcn(app, @KP1EditFieldValueChanged, true);
            app.KP1EditField.Position = [61 135 63 22];
            app.KP1EditField.Value = 1;

            % Create KI1EditFieldLabel
            app.KI1EditFieldLabel = uilabel(app.UIFigure);
            app.KI1EditFieldLabel.HorizontalAlignment = 'right';
            app.KI1EditFieldLabel.FontName = 'InconsolataGo';
            app.KI1EditFieldLabel.Position = [22 102 25 22];
            app.KI1EditFieldLabel.Text = 'KI1';

            % Create KI1EditField
            app.KI1EditField = uieditfield(app.UIFigure, 'numeric');
            app.KI1EditField.ValueChangedFcn = createCallbackFcn(app, @KI1EditFieldValueChanged, true);
            app.KI1EditField.Position = [62 102 63 22];

            % Create KD1EditFieldLabel
            app.KD1EditFieldLabel = uilabel(app.UIFigure);
            app.KD1EditFieldLabel.HorizontalAlignment = 'right';
            app.KD1EditFieldLabel.FontName = 'InconsolataGo';
            app.KD1EditFieldLabel.Position = [21 70 25 22];
            app.KD1EditFieldLabel.Text = 'KD1';

            % Create KD1EditField
            app.KD1EditField = uieditfield(app.UIFigure, 'numeric');
            app.KD1EditField.ValueChangedFcn = createCallbackFcn(app, @KD1EditFieldValueChanged, true);
            app.KD1EditField.Position = [61 70 63 22];

            % Create KP2EditFieldLabel
            app.KP2EditFieldLabel = uilabel(app.UIFigure);
            app.KP2EditFieldLabel.HorizontalAlignment = 'right';
            app.KP2EditFieldLabel.FontName = 'InconsolataGo';
            app.KP2EditFieldLabel.Position = [151 136 25 22];
            app.KP2EditFieldLabel.Text = 'KP2';

            % Create KP2EditField
            app.KP2EditField = uieditfield(app.UIFigure, 'numeric');
            app.KP2EditField.ValueChangedFcn = createCallbackFcn(app, @KP2EditFieldValueChanged, true);
            app.KP2EditField.Position = [191 136 63 22];
            app.KP2EditField.Value = 1;

            % Create KI2EditFieldLabel
            app.KI2EditFieldLabel = uilabel(app.UIFigure);
            app.KI2EditFieldLabel.HorizontalAlignment = 'right';
            app.KI2EditFieldLabel.FontName = 'InconsolataGo';
            app.KI2EditFieldLabel.Position = [152 103 25 22];
            app.KI2EditFieldLabel.Text = 'KI2';

            % Create KI2EditField
            app.KI2EditField = uieditfield(app.UIFigure, 'numeric');
            app.KI2EditField.ValueChangedFcn = createCallbackFcn(app, @KI2EditFieldValueChanged, true);
            app.KI2EditField.Position = [192 103 63 22];

            % Create KD2EditFieldLabel
            app.KD2EditFieldLabel = uilabel(app.UIFigure);
            app.KD2EditFieldLabel.HorizontalAlignment = 'right';
            app.KD2EditFieldLabel.FontName = 'InconsolataGo';
            app.KD2EditFieldLabel.Position = [152 71 25 22];
            app.KD2EditFieldLabel.Text = 'KD2';

            % Create KD2EditField
            app.KD2EditField = uieditfield(app.UIFigure, 'numeric');
            app.KD2EditField.ValueChangedFcn = createCallbackFcn(app, @KD2EditFieldValueChanged, true);
            app.KD2EditField.Position = [192 71 63 22];

            % Create KP3EditFieldLabel
            app.KP3EditFieldLabel = uilabel(app.UIFigure);
            app.KP3EditFieldLabel.HorizontalAlignment = 'right';
            app.KP3EditFieldLabel.FontName = 'InconsolataGo';
            app.KP3EditFieldLabel.Position = [284 134 25 22];
            app.KP3EditFieldLabel.Text = 'KP3';

            % Create KP3EditField
            app.KP3EditField = uieditfield(app.UIFigure, 'numeric');
            app.KP3EditField.ValueChangedFcn = createCallbackFcn(app, @KP3EditFieldValueChanged, true);
            app.KP3EditField.Position = [324 134 63 22];
            app.KP3EditField.Value = 1;

            % Create KI3EditFieldLabel
            app.KI3EditFieldLabel = uilabel(app.UIFigure);
            app.KI3EditFieldLabel.HorizontalAlignment = 'right';
            app.KI3EditFieldLabel.FontName = 'InconsolataGo';
            app.KI3EditFieldLabel.Position = [285 101 25 22];
            app.KI3EditFieldLabel.Text = 'KI3';

            % Create KI3EditField
            app.KI3EditField = uieditfield(app.UIFigure, 'numeric');
            app.KI3EditField.ValueChangedFcn = createCallbackFcn(app, @KI3EditFieldValueChanged, true);
            app.KI3EditField.Position = [325 101 63 22];

            % Create KD3EditFieldLabel
            app.KD3EditFieldLabel = uilabel(app.UIFigure);
            app.KD3EditFieldLabel.HorizontalAlignment = 'right';
            app.KD3EditFieldLabel.FontName = 'InconsolataGo';
            app.KD3EditFieldLabel.Position = [285 69 25 22];
            app.KD3EditFieldLabel.Text = 'KD3';

            % Create KD3EditField
            app.KD3EditField = uieditfield(app.UIFigure, 'numeric');
            app.KD3EditField.ValueChangedFcn = createCallbackFcn(app, @KD3EditFieldValueChanged, true);
            app.KD3EditField.Position = [325 69 63 22];

            % Create q1EditFieldLabel
            app.q1EditFieldLabel = uilabel(app.UIFigure);
            app.q1EditFieldLabel.HorizontalAlignment = 'right';
            app.q1EditFieldLabel.FontName = 'InconsolataGo';
            app.q1EditFieldLabel.Position = [448 136 25 22];
            app.q1EditFieldLabel.Text = 'q1';

            % Create q1EditField
            app.q1EditField = uieditfield(app.UIFigure, 'numeric');
            app.q1EditField.ValueChangedFcn = createCallbackFcn(app, @q1EditFieldValueChanged, true);
            app.q1EditField.Position = [488 136 63 22];
            app.q1EditField.Value = 1;

            % Create q2EditFieldLabel
            app.q2EditFieldLabel = uilabel(app.UIFigure);
            app.q2EditFieldLabel.HorizontalAlignment = 'right';
            app.q2EditFieldLabel.FontName = 'InconsolataGo';
            app.q2EditFieldLabel.Position = [449 103 25 22];
            app.q2EditFieldLabel.Text = 'q2';

            % Create q2EditField
            app.q2EditField = uieditfield(app.UIFigure, 'numeric');
            app.q2EditField.ValueChangedFcn = createCallbackFcn(app, @q2EditFieldValueChanged, true);
            app.q2EditField.Position = [489 103 63 22];

            % Create q3EditFieldLabel
            app.q3EditFieldLabel = uilabel(app.UIFigure);
            app.q3EditFieldLabel.HorizontalAlignment = 'right';
            app.q3EditFieldLabel.FontName = 'InconsolataGo';
            app.q3EditFieldLabel.Position = [449 71 25 22];
            app.q3EditFieldLabel.Text = 'q3';

            % Create q3EditField
            app.q3EditField = uieditfield(app.UIFigure, 'numeric');
            app.q3EditField.ValueChangedFcn = createCallbackFcn(app, @q3EditFieldValueChanged, true);
            app.q3EditField.Position = [489 71 63 22];

            % Create ControlModeDropDownLabel
            app.ControlModeDropDownLabel = uilabel(app.UIFigure);
            app.ControlModeDropDownLabel.HorizontalAlignment = 'right';
            app.ControlModeDropDownLabel.Position = [610 236 78 22];
            app.ControlModeDropDownLabel.Text = 'Control-Mode';

            % Create ControlModeDropDown
            app.ControlModeDropDown = uidropdown(app.UIFigure);
            app.ControlModeDropDown.Items = {'Zero-ref', 'Open loop', 'Closed loop', 'Sines'};
            app.ControlModeDropDown.ValueChangedFcn = createCallbackFcn(app, @ControlModeDropDownValueChanged, true);
            app.ControlModeDropDown.Position = [695 236 118 22];
            app.ControlModeDropDown.Value = 'Zero-ref';

            % Create WSliderLabel
            app.WSliderLabel = uilabel(app.UIFigure);
            app.WSliderLabel.HorizontalAlignment = 'right';
            app.WSliderLabel.Position = [459 443 25 22];
            app.WSliderLabel.Text = 'W';

            % Create WSlider
            app.WSlider = uislider(app.UIFigure);
            app.WSlider.Limits = [-1 1];
            app.WSlider.Orientation = 'vertical';
            app.WSlider.ValueChangedFcn = createCallbackFcn(app, @WSliderValueChanged, true);
            app.WSlider.ValueChangingFcn = createCallbackFcn(app, @WSliderValueChanging, true);
            app.WSlider.BusyAction = 'cancel';
            app.WSlider.Position = [505 452 3 150];

            % Create ActivateWButton
            app.ActivateWButton = uibutton(app.UIFigure, 'push');
            app.ActivateWButton.ButtonPushedFcn = createCallbackFcn(app, @ActivateWButtonPushed, true);
            app.ActivateWButton.Position = [454 406 100 22];
            app.ActivateWButton.Text = 'Activate W';

            % Create AWEditFieldLabel
            app.AWEditFieldLabel = uilabel(app.UIFigure);
            app.AWEditFieldLabel.HorizontalAlignment = 'right';
            app.AWEditFieldLabel.FontName = 'InconsolataGo';
            app.AWEditFieldLabel.FontSize = 14;
            app.AWEditFieldLabel.Position = [452 654 25 22];
            app.AWEditFieldLabel.Text = 'AW';

            % Create AWEditField
            app.AWEditField = uieditfield(app.UIFigure, 'numeric');
            app.AWEditField.ValueChangedFcn = createCallbackFcn(app, @AWEditFieldValueChanged, true);
            app.AWEditField.Position = [492 654 63 22];

            % Create FWEditFieldLabel
            app.FWEditFieldLabel = uilabel(app.UIFigure);
            app.FWEditFieldLabel.HorizontalAlignment = 'right';
            app.FWEditFieldLabel.FontName = 'InconsolataGo';
            app.FWEditFieldLabel.FontSize = 14;
            app.FWEditFieldLabel.Position = [452 621 25 22];
            app.FWEditFieldLabel.Text = 'FW';

            % Create FWEditField
            app.FWEditField = uieditfield(app.UIFigure, 'numeric');
            app.FWEditField.ValueChangedFcn = createCallbackFcn(app, @FWEditFieldValueChanged, true);
            app.FWEditField.Position = [492 621 63 22];

            % Create SatU1EditFieldLabel
            app.SatU1EditFieldLabel = uilabel(app.UIFigure);
            app.SatU1EditFieldLabel.HorizontalAlignment = 'right';
            app.SatU1EditFieldLabel.FontName = 'InconsolataGo';
            app.SatU1EditFieldLabel.FontSize = 14;
            app.SatU1EditFieldLabel.Position = [24 335 40 22];
            app.SatU1EditFieldLabel.Text = 'SatU1';

            % Create SatU1EditField
            app.SatU1EditField = uieditfield(app.UIFigure, 'numeric');
            app.SatU1EditField.ValueChangedFcn = createCallbackFcn(app, @SatU1EditFieldValueChanged, true);
            app.SatU1EditField.Position = [79 334 63 22];

            % Create SatU2EditFieldLabel
            app.SatU2EditFieldLabel = uilabel(app.UIFigure);
            app.SatU2EditFieldLabel.HorizontalAlignment = 'right';
            app.SatU2EditFieldLabel.FontName = 'InconsolataGo';
            app.SatU2EditFieldLabel.FontSize = 14;
            app.SatU2EditFieldLabel.Position = [150 334 40 22];
            app.SatU2EditFieldLabel.Text = 'SatU2';

            % Create SatU2EditField
            app.SatU2EditField = uieditfield(app.UIFigure, 'numeric');
            app.SatU2EditField.ValueChangedFcn = createCallbackFcn(app, @SatU2EditFieldValueChanged, true);
            app.SatU2EditField.Position = [205 334 63 22];

            % Create SatU3EditFieldLabel
            app.SatU3EditFieldLabel = uilabel(app.UIFigure);
            app.SatU3EditFieldLabel.HorizontalAlignment = 'right';
            app.SatU3EditFieldLabel.FontName = 'InconsolataGo';
            app.SatU3EditFieldLabel.FontSize = 14;
            app.SatU3EditFieldLabel.Position = [276 334 40 22];
            app.SatU3EditFieldLabel.Text = 'SatU3';

            % Create SatU3EditField
            app.SatU3EditField = uieditfield(app.UIFigure, 'numeric');
            app.SatU3EditField.ValueChangedFcn = createCallbackFcn(app, @SatU3EditFieldValueChanged, true);
            app.SatU3EditField.Position = [331 334 63 22];

            % Create SatWEditFieldLabel
            app.SatWEditFieldLabel = uilabel(app.UIFigure);
            app.SatWEditFieldLabel.HorizontalAlignment = 'right';
            app.SatWEditFieldLabel.FontName = 'InconsolataGo';
            app.SatWEditFieldLabel.FontSize = 14;
            app.SatWEditFieldLabel.Position = [438 334 39 22];
            app.SatWEditFieldLabel.Text = 'SatW';

            % Create SatWEditField
            app.SatWEditField = uieditfield(app.UIFigure, 'numeric');
            app.SatWEditField.ValueChangedFcn = createCallbackFcn(app, @SatWEditFieldValueChanged, true);
            app.SatWEditField.Position = [486 334 63 22];

            % Create SaveParametersButton
            app.SaveParametersButton = uibutton(app.UIFigure, 'push');
            app.SaveParametersButton.ButtonPushedFcn = createCallbackFcn(app, @SaveParametersButtonPushed, true);
            app.SaveParametersButton.Position = [441 227 126 51];
            app.SaveParametersButton.Text = 'Save Parameters';

            % Create LoadedLampLabel
            app.LoadedLampLabel = uilabel(app.UIFigure);
            app.LoadedLampLabel.HorizontalAlignment = 'right';
            app.LoadedLampLabel.Position = [747 602 46 36];
            app.LoadedLampLabel.Text = 'Loaded';

            % Create LoadedLamp
            app.LoadedLamp = uilamp(app.UIFigure);
            app.LoadedLamp.HandleVisibility = 'off';
            app.LoadedLamp.Tag = 'lampFlag';
            app.LoadedLamp.Position = [808 602 35 35];

            % Create q1Label
            app.q1Label = uilabel(app.UIFigure);
            app.q1Label.Position = [695 136 108 22];
            app.q1Label.Text = 'q1';

            % Create q2Label
            app.q2Label = uilabel(app.UIFigure);
            app.q2Label.Position = [695 102 103 22];
            app.q2Label.Text = 'q2';

            % Create q3Label
            app.q3Label = uilabel(app.UIFigure);
            app.q3Label.Position = [695 68 103 22];
            app.q3Label.Text = 'q3';

            % Create LoadRefButton
            app.LoadRefButton = uibutton(app.UIFigure, 'push');
            app.LoadRefButton.ButtonPushedFcn = createCallbackFcn(app, @LoadRefButtonPushed, true);
            app.LoadRefButton.Position = [262 227 126 51];
            app.LoadRefButton.Text = 'Load Ref';

            % Create ControlmodeLabel
            app.ControlmodeLabel = uilabel(app.UIFigure);
            app.ControlmodeLabel.Position = [725 278 78 22];
            app.ControlmodeLabel.Text = 'Control mode';

            % Create StartButton
            app.StartButton = uibutton(app.UIFigure, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed, true);
            app.StartButton.Icon = 'slrtRunIcon.png';
            app.StartButton.IconAlignment = 'center';
            app.StartButton.Position = [781 653 76 51];
            app.StartButton.Text = '';

            % Create StopButton
            app.StopButton = uibutton(app.UIFigure, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.Icon = 'slrtStopIcon.png';
            app.StopButton.IconAlignment = 'center';
            app.StopButton.Position = [656 654 76 51];
            app.StopButton.Text = '';

            % Create StatusBar
            app.StatusBar = slrealtime.ui.control.StatusBar(app.UIFigure);
            app.StatusBar.BackgroundColor = [0.7843 0.9804 1];
            app.StatusBar.BusyAction = 'cancel';
            app.StatusBar.Position = [27 13 230 30];

            % Create ClosedloopPIDparametersforComaujointsq1q2q3Label
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label = uilabel(app.UIFigure);
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label.FontSize = 14;
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label.FontWeight = 'bold';
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label.Position = [26 174 384 22];
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label.Text = 'Closed-loop PID parameters for Comau joints (q1,q2,q3)';

            % Create ExecutiontimeLabel
            app.ExecutiontimeLabel = uilabel(app.UIFigure);
            app.ExecutiontimeLabel.Position = [132 257 85 22];
            app.ExecutiontimeLabel.Text = 'Execution-time';

            % Create StoptimesetableLabel
            app.StoptimesetableLabel = uilabel(app.UIFigure);
            app.StoptimesetableLabel.Position = [133 222 107 22];
            app.StoptimesetableLabel.Text = 'Stop-time (setable)';

            % Create JointreferencesdegLabel
            app.JointreferencesdegLabel = uilabel(app.UIFigure);
            app.JointreferencesdegLabel.FontSize = 14;
            app.JointreferencesdegLabel.FontWeight = 'bold';
            app.JointreferencesdegLabel.Position = [457 174 152 22];
            app.JointreferencesdegLabel.Text = 'Joint references [deg]';

            % Create JointmeasurementsdegLabel
            app.JointmeasurementsdegLabel = uilabel(app.UIFigure);
            app.JointmeasurementsdegLabel.FontSize = 14;
            app.JointmeasurementsdegLabel.FontWeight = 'bold';
            app.JointmeasurementsdegLabel.Position = [633 174 180 22];
            app.JointmeasurementsdegLabel.Text = 'Joint measurements [deg]';

            % Create ClosedloopPIDparametersforComaujointsq1q2q3Label_2
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_2 = uilabel(app.UIFigure);
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_2.FontSize = 14;
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_2.FontWeight = 'bold';
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_2.Position = [23 360 541 22];
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_2.Text = 'Safety limits for motor velocity inputs (deg/sec for robot and m/sec for winch)';

            % Create ControlmodestateLabel
            app.ControlmodestateLabel = uilabel(app.UIFigure);
            app.ControlmodestateLabel.Position = [595 278 108 22];
            app.ControlmodestateLabel.Text = 'Control-mode state';

            % Create SDIviewDropDownLabel
            app.SDIviewDropDownLabel = uilabel(app.UIFigure);
            app.SDIviewDropDownLabel.HorizontalAlignment = 'right';
            app.SDIviewDropDownLabel.Position = [619 21 61 22];
            app.SDIviewDropDownLabel.Text = 'SDI view';

            % Create SDIviewDropDown
            app.SDIviewDropDown = uidropdown(app.UIFigure);
            app.SDIviewDropDown.Items = {'open-loop', 'closed-loop', 'comau (ref,u)', 'comau-sines'};
            app.SDIviewDropDown.ValueChangedFcn = createCallbackFcn(app, @SDIviewDropDownValueChanged, true);
            app.SDIviewDropDown.Position = [691 21 122 22];
            app.SDIviewDropDown.Value = 'open-loop';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [588 306 269 243];
            app.Image.ImageSource = 'hmi.png';

            % Create ClosedloopPIDparametersforComaujointsq1q2q3Label_3
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_3 = uilabel(app.UIFigure);
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_3.FontSize = 14;
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_3.FontWeight = 'bold';
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_3.Position = [28 682 536 22];
            app.ClosedloopPIDparametersforComaujointsq1q2q3Label_3.Text = 'Sinusoidal velocity references (amptitude in deg/sec or m/sec, and freq in Hz) ';

            % Create MessageLabel
            app.MessageLabel = uilabel(app.UIFigure);
            app.MessageLabel.Position = [439 21 158 22];
            app.MessageLabel.Text = 'Message';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = sg_app(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end