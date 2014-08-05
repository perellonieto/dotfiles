function f = plot_component_sizes(component_sizes)
        f = figure;
        hist(component_sizes);
        xlabel('sizes');
        ylabel('frequencies');
        set(gcf,'PaperPositionMode','auto');
end