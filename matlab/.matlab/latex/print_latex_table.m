function print_latex_table(table, header, caption, label)

    if exist('caption', 'var') == false
        caption = 'Caption';
    end
    
    if exist('label', 'var') == false
        label = 'lab:';
    end
    
    rows = size(table,1);
    cols = size(table,2);
    
    fprintf('\\begin{center}\n');
    fprintf('\\begin{tabular}{');
    for i = 1:cols
        fprintf('|c');
    end
    
    fprintf('|}\\hline\n');
    
    if exist('header', 'var')
        for i = 1:cols-1
            fprintf('\t%s\t&', header{i});
        end
        fprintf('\t%s\t\\\\ \n', header{i});
    end
    
    for i = 1:rows
        for j = 1:cols-1
            fprintf('\t%i\t&', table(i,j));
        end
        fprintf('\t%i\t\\\\ \n', table(i,cols));
    end
    fprintf('\t\\hline\n\\end{tabular}\n');
    fprintf('\\captionof{table}{%s}\n', caption);
    fprintf('\\label{%s}\n', label);
    fprintf('\\end{center}\n\n');
end