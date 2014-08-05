function f = plot_degrees(degrees, logscale)
        if ~exist('logscale', 'var');
            logscale = false;
        end

        f = figure;
        hist(degrees);
        if logscale == true
            set(gca, 'YScale', 'log');
            set(gca, 'XScale', 'log');
            xlabel('log degrees');
            ylabel('log frequencies');
        else
            xlabel('degrees');
            ylabel('frequencies');
        end

        set(gcf,'PaperPositionMode','auto');
        %set(f,'FaceColor', 'b');
end