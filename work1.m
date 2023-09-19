clc;
clear;
work_max = 0;
T5=600; % maximum temperature
p4=290; % maximum pressure 

        for p1=20:-0.1:0.1 
            for p2=p1:0.1:p4 
                v1=XSteam('vL_p',p1);
                h1=XSteam('hL_p', p1);
                s1=XSteam('sL_p',p1);
                T1=XSteam('Tsat_p',p1);
                s2=s1;
                h2=XSteam('h_ps',p2,s2);
                T2=XSteam('T_ps',p2,s2);
                p3=p2;
                v3=XSteam('vL_p',p3);
                s3=XSteam('sL_p',p3);
                h3=XSteam('hL_p',p3);
                T3=XSteam('Tsat_p',p3);
                s4=s3;
                h4=XSteam('h_ps',p4,s4);
                T4=XSteam('T_ps',p4,s4);
                p5=p4;
                h5=XSteam('h_pT',p5,T5);
                s5=XSteam('s_pT',p5,T5);
                p6=p2;
                s6=s5;
                h6=XSteam('h_ps',p6,s6);
                x6=XSteam('x_ps',p6,s6);
                T6=XSteam('T_ps',p6,s6);
                p7=p2;
                T7=T5;
                h7=XSteam('h_pT',p7,T7);
                s7=XSteam('s_pT',p7,T7);
                p8=p1;
                s8=s7;
                h8=XSteam('h_ps',p8,s8);
                x8=XSteam('x_ps',p8,s8);
                T8=T1;
                y= (h3-h6)/(h2-h6);
                
                if x8 >= 0.9
                    W_pump = (y*v1*(p2-p1)+ v3*(p4-p3))*100; 
                    W_turb = (h5-h6)+ y*(h7-h8);
                    W_net = W_turb - W_pump;  
                    q_in = (h5-h4) + y*(h7-h6);  
                    eff = (W_net/q_in)*100 ;
                    
                    if W_net > work_max
                        work_max=W_net;
                        eff_max=eff;
                        T_max = T5; % already const
                        P_max = p4; % already const
                        P_min = p1;
                        P_mid = p2;
                        W_delta=W_net;  
                        y_ofw = 1-y; 
                        Q_in=q_in;
                        S1=s1;S2=s2;S3=s3;S4=s4;S5=s5;S6=s6;S7=s7;S8=s8;
                        t1=T1;t2=T2;t3=T3;t4=T4;t5=T5;t6=T6;t7=T7;t8=T8;
                        P1=p1;P2=p2;P3=p3;P4=p4;P5=p5;P6=p6;P7=p7;P8=p8;
                        H1=h1;H2=h2;H3=h3;H4=h4;H5=h5;H6=h6;H7=h7;H8=h8;
                    end
                end
            end
        end
    

disp('maximum efficiency %');
disp(eff_max);
disp('maximum temperature in celsius');
disp(T_max);
disp('maximun pressure in bar');
disp(P_max);
disp('minimum pressure in bar');
disp(P_min);
disp('intermediate pressure in bar');
disp(P_mid);
disp ('maximum network in Kj/Kg');
disp(W_delta);
disp('open feed water steam fraction');
disp(y_ofw);
S=[S1,S2,S3,S4,S5,S6,S7,S8];
t=[t1,t2,t3,t4,t5,t6,t7,t8];
H=[H1,H2,H3,H4,H5,H6,H7,H8];
P=[P1,P2,P3,P4,P5,P6,P7,P8];
disp(' s values')
disp(S);
disp(' T values')
disp(t);
disp(' h values')
disp(H);
disp(' p values')
disp(P);
%c = linspace(1,10,length(s));
%scatter(s,T,25,c,'filled')                   
                
                
                
                