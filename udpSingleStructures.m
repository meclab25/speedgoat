%% RX - Send-data (rx-data for TwinCAT3)
rx = struct;
rx.key = uint32(46505228);
rx.cnt = uint32(0);
rx.cmd = uint32(0); 

rx.em8000_u1 = single(0);
rx.em8000_u2 = single(0);
rx.em8000_u3 = single(0);
rx.em8000_u4 = single(0);
rx.em8000_u5 = single(0);
rx.em8000_u6 = single(0);

rx.em8000_u1t = single(0);
rx.em8000_u2t = single(0);
rx.em8000_u3t = single(0);
rx.em8000_u4t = single(0);
rx.em8000_u5t = single(0);
rx.em8000_u6t = single(0);

rx.em1500_u1 = single(0);
rx.em1500_u2 = single(0);
rx.em1500_u3 = single(0);
rx.em1500_u4 = single(0);
rx.em1500_u5 = single(0);
rx.em1500_u6 = single(0);

rx.em1500_u1t = single(0);
rx.em1500_u2t = single(0);
rx.em1500_u3t = single(0);
rx.em1500_u4t = single(0);
rx.em1500_u5t = single(0);
rx.em1500_u6t = single(0);

rx.comau_u1 = single(0);
rx.comau_u2 = single(0);
rx.comau_u3 = single(0);
rx.comau_u4 = single(0);
rx.comau_u5 = single(0);
rx.comau_u6 = single(0);

rx.winch_u = single(0);

%% TX - Receive-data (tx-data for TwinCAT3)
tx = struct;
tx.mode = uint32(0);
tx.time = single(0);

tx.comau_q1 = single(0);
tx.comau_q2 = single(0);
tx.comau_q3 = single(0);
tx.comau_q4 = single(0);
tx.comau_q5 = single(0);
tx.comau_q6 = single(0);

tx.comau_q1t = single(0);
tx.comau_q2t = single(0);
tx.comau_q3t = single(0);
tx.comau_q4t = single(0);
tx.comau_q5t = single(0);
tx.comau_q6t = single(0);

tx.winch_l = single(0);
tx.winch_lt = single(0);

tx.em8000_eta1 = single(0);
tx.em8000_eta2 = single(0);
tx.em8000_eta3 = single(0);
tx.em8000_eta4 = single(0);
tx.em8000_eta5 = single(0);
tx.em8000_eta6 = single(0);

tx.em8000_eta1t = single(0);
tx.em8000_eta2t = single(0);
tx.em8000_eta3t = single(0);
tx.em8000_eta4t = single(0);
tx.em8000_eta5t = single(0);
tx.em8000_eta6t = single(0);

tx.em8000_eta1tt = single(0);
tx.em8000_eta2tt = single(0);
tx.em8000_eta3tt = single(0);
tx.em8000_eta4tt = single(0);
tx.em8000_eta5tt = single(0);
tx.em8000_eta6tt = single(0);


tx.mru1_eta1 = single(0);
tx.mru1_eta2 = single(0);
tx.mru1_eta3 = single(0);
tx.mru1_eta4 = single(0);
tx.mru1_eta5 = single(0);
tx.mru1_eta6 = single(0);

tx.mru1_v1 = single(0);
tx.mru1_v2 = single(0);
tx.mru1_v3 = single(0);
tx.mru1_v4 = single(0);
tx.mru1_v5 = single(0);
tx.mru1_v6 = single(0);

tx.em1500_eta1 = single(0);
tx.em1500_eta2 = single(0);
tx.em1500_eta3 = single(0);
tx.em1500_eta4 = single(0);
tx.em1500_eta5 = single(0);
tx.em1500_eta6 = single(0);

tx.em1500_eta1t = single(0);
tx.em1500_eta2t = single(0);
tx.em1500_eta3t = single(0);
tx.em1500_eta4t = single(0);
tx.em1500_eta5t = single(0);
tx.em1500_eta6t = single(0);

tx.em1500_eta1tt = single(0);
tx.em1500_eta2tt = single(0);
tx.em1500_eta3tt = single(0);
tx.em1500_eta4tt = single(0);
tx.em1500_eta5tt = single(0);
tx.em1500_eta6tt = single(0);


tx.mru2_eta1 = single(0);
tx.mru2_eta2 = single(0);
tx.mru2_eta3 = single(0);
tx.mru2_eta4 = single(0);
tx.mru2_eta5 = single(0);
tx.mru2_eta6 = single(0);

tx.mru2_v1 = single(0);
tx.mru2_v2 = single(0);
tx.mru2_v3 = single(0);
tx.mru2_v4 = single(0);
tx.mru2_v5 = single(0);
tx.mru2_v6 = single(0);
