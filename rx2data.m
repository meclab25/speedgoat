% data = RX2DATA(rx)
% ---------------------------------
% Convert rx-struct to udp data.
% For endianness, look at SWAPBYTES
% ---------------------------------
% Edited 29.01.25 - added winch data
function [data1, data2, data3, data4, data5] = rx2data(rx)

    data1 = uint32([0,0,0]);
    data2 = single(zeros(1, 24));
    data3 = single(zeros(1, 3));
    data4 = single(zeros(1, 3));

    data1(1) = uint32(rx.key);
    data1(2) = uint32(rx.cnt);
    data1(3) = uint32(rx.cmd);

    data2(1) = single(rx.em8000_u1);
    data2(2) = single(rx.em8000_u2);
    data2(3) = single(rx.em8000_u3);
    data2(4) = single(rx.em8000_u4);
    data2(5) = single(rx.em8000_u5);
    data2(6) = single(rx.em8000_u6);

    data2(7) = single(rx.em8000_u1t);
    data2(8) = single(rx.em8000_u2t);
    data2(9) = single(rx.em8000_u3t);
    data2(10) = single(rx.em8000_u4t);
    data2(11) = single(rx.em8000_u5t);
    data2(12) = single(rx.em8000_u6t);
    
    data2(13) = single(rx.em1500_u1);
    data2(14) = single(rx.em1500_u2);
    data2(15) = single(rx.em1500_u3);
    data2(16) = single(rx.em1500_u4);
    data2(17) = single(rx.em1500_u5);
    data2(18) = single(rx.em1500_u6);

    data2(19) = single(rx.em1500_u1t);
    data2(20) = single(rx.em1500_u2t);
    data2(21) = single(rx.em1500_u3t);
    data2(22) = single(rx.em1500_u4t);
    data2(23) = single(rx.em1500_u5t);
    data2(24) = single(rx.em1500_u6t);   

    data3(1) = single(rx.comau_u4);
    data3(2) = single(rx.comau_u5);
    data3(3) = single(rx.comau_u6);
    data4(1) = single(rx.comau_u1);
    data4(2) = single(rx.comau_u2);
    data4(3) = single(rx.comau_u3);

    data5 = single(rx.winch_u);

end

