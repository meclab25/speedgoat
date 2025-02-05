% [r, Dr, DDr] = polyPath(t, tf, r0, rf)
% [r, Dr, DDr] = polyPath(t, tf, r0, rf, j0, jf)
% =========================================================================
% r: 3-by-N array of positions
% Dr: 3-by-N array of velocities
% DDr: 3-by-N array of acceleration
% t: time vector
% tf: end-point of trajectory
% r0: initial position
% rf: final position
% j0: initial jerk (for trajectories returning to r0)
% jf: final jerk (for trajectories returning to r0)
function [x, Dx, DDx] = polyPath(tt, tf, x0, xf, varargin)
    t0 = tt(1);
    el = find(tt >= tf, 1, 'first');
    t = tt(1:el);
    t2 = tt((el+1):end);
    N2 = numel(t2);
    if nargin == 4
        M = [
            t0^5, t0^4, t0^3, t0^2, t0, 1;
            5*t0^4, 4*t0^3, 3*t0^2, 2*t0, 1, 0;
            20*t0^3, 12*t0^2, 6*t0, 2, 0, 0;
            tf^5, tf^4, tf^3, tf^2, tf, 1;
            5*tf^4, 4*tf^3, 3*tf^2, 2*tf, 1, 0;
            20*tf^3, 12*tf^2, 6*tf, 2, 0, 0];
        cx = M \ [x0(1), 0, 0, xf(1), 0, 0].';
        cy = M \ [x0(2), 0, 0, xf(2), 0, 0].';
        cz = M \ [x0(3), 0, 0, xf(3), 0, 0].';
    elseif nargin == 6
        j0 = varargin{1};
        jf = varargin{2};
        M = [
            t0^7, t0^6, t0^5, t0^4, t0^3, t0^2, t0, 1;
            7*t0^6, 6*t0^5, 5*t0^4, 4*t0^3, 3*t0^2, 2*t0, 1, 0;
            42*t0^5, 30*t0^4, 20*t0^3, 12*t0^2, 6*t0, 2, 0, 0;
            210*t0^4, 120*t0^3, 60*t0^2, 24*t0, 6, 0, 0, 0;
            tf^7, tf^6, tf^5, tf^4, tf^3, tf^2, tf, 1;
            7*tf^6, 6*tf^5, 5*tf^4, 4*tf^3, 3*tf^2, 2*tf, 1, 0;
            42*tf^5, 30*tf^4, 20*tf^3, 12*tf^2, 6*tf, 2, 0, 0;
            210*tf^4, 120*tf^3, 60*tf^2, 24*tf, 6, 0, 0, 0
            ];
            
        cx = M \ [x0(1), 0, 0, j0(1), xf(1), 0, 0, jf(1)].';
        cy = M \ [x0(2), 0, 0, j0(2), xf(2), 0, 0, jf(2)].';
        cz = M \ [x0(3), 0, 0, j0(3), xf(3), 0, 0, jf(3)].';
    else
        error("wrong input argument");
    end
    Dcx = polyder(cx);
    DDcx = polyder(Dcx);
    Dcy = polyder(cy);
    DDcy = polyder(Dcy);
    Dcz = polyder(cz);
    DDcz = polyder(Dcz);
    x = [polyval(cx, t); polyval(cy, t); polyval(cz, t)];
    Dx = [polyval(Dcx, t); polyval(Dcy, t); polyval(Dcz, t)];
    DDx = [polyval(DDcx, t); polyval(DDcy, t); polyval(DDcz, t)];
    x = [x, x(:, end)*ones(1, N2)];
    Dx = [Dx, zeros(3, N2)];
    DDx = [DDx, zeros(3, N2)];
end