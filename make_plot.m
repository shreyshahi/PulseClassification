% Makes the plot of original ground motion, extracted pulse and residual
% ground motion

function [] = make_plot(pulseData)

for j = 1:5
    buff = pulseData{j};
    if(buff.is_pulse == 1)
        signal = buff.signal;
        pulse_th = buff.pulse_th;
        resid_th = buff.resid_th;
        record_dt = buff.dt;
        
        np = length(signal);
        time = record_dt:record_dt:record_dt*np;
        
        fig = figure();
        subplot(3,1,1)
        plot(time, signal, '-k')
        legend('Original ground motion')
        set(gca, 'xticklabel', [])
        yl= [-max(abs(get(gca, 'ylim'))) max(abs(get(gca, 'ylim')))];
        set(gca, 'ylim', yl)
        
        subplot(3,1,2)
        
        plot(time, pulse_th, '-r')
        legend('Extracted pulse')
        
        hy = ylabel('Velocity [cm/s]');
        set(gca, 'xticklabel', [])
        set(gca, 'ylim', yl)
        
        subplot(3,1,3)
        plot(time, resid_th , '-k')
        legend('Residual ground motion')
        hx = xlabel('Time [s]');
        set(gca, 'ylim', yl)
        
        break;
    end
end