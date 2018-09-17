dataTable = readtable('SkillCraft1_Dataset.csv');
dataTable = dataTable(:,6:20);
for i = 1:15
    array_1 = table2array(dataTable(:,i));
    if(iscell(array_1))
        col_1 = zeros(size(array_1,1),size(array_1,2));
        col_1 = str2double(array_1);
    else
        col_1 = array_1;
    end
    for j = 1:15
        array_2 = table2array(dataTable(:,j));
        if(iscell(array_2))
            col_2 = zeros(size(array_2,1),size(array_2,2));
            col_2 = str2double(array_2);
        else
            col_2 = array_2;
        end
        
        covariance = cov(col_1,col_2);
        standardDev_i = std(col_1);
        standardDev_j = std(col_2);
        all_pccs(i,j) = (covariance(1,2) / (standardDev_i*standardDev_j));
    end
end

dlmwrite('pcc.txt',all_pccs,'delimiter','\t', 'precision',3)

% To find min and max
min_val = realmax('double');
max_val = realmin('double');
for i = 1:15
    for j = 1:15
        if i ~= j
            if all_pccs(i,j) < min_val
                min_val = all_pccs(i,j);
            end
            
            if all_pccs(i,j) > max_val
                max_val = all_pccs(i,j);
            end
        end
    end
end

[min_r,min_c] = find(all_pccs == min_val);
[max_r,max_c] = find(all_pccs == max_val);

[min_dim1_r,min_dim2_r] = size(min_r);
[max_dim1_r,max_dim2_r] = size(max_r);

min_rows =[];
filext = '.png';
divstr ='_';
for i = 1:min_dim1_r
    if ismember(min_c(i,1),min_rows) == false
        min_attr1 = min_r(i,1);
        min_attr2 = min_c(i,1);
        min_rows(i) = min_r(i,1);
        
        min_col_1 = table2array(dataTable(:,min_attr1));
        min_col_2 = table2array(dataTable(:,min_attr2));
        
        if(iscell(min_col_1))
            col_1 = zeros(size(min_col_1,1),size(min_col_1,2));
            col_1 = str2double(min_col_1);
        else
            col_1= min_col_1;
        end
        
        if(iscell(min_col_2))
            col_2 = zeros(size(min_col_2,1),size(min_col_2,2));
            col_2 = str2double(min_col_2);
        else
            col_2 = min_col_2;
        end
        
        plot = scatter(col_1,col_2);
        xlabel(dataTable.Properties.VariableNames(min_attr1));
        ylabel(dataTable.Properties.VariableNames(min_attr2));
        saveas(plot,strcat(char(dataTable.Properties.VariableNames(min_attr1)),divstr,char(dataTable.Properties.VariableNames(min_attr2)),filext));
    end
end

max_rows =[];
for i = 1:max_dim1_r
    if ismember(max_c(i,1),max_rows) == false
        max_attr1 = max_r(i,1);
        max_attr2 = max_c(i,1);
        max_rows(i) = max_r(i,1);
        
        max_col_1 = table2array(dataTable(:,max_attr1));
        max_col_2 = table2array(dataTable(:,max_attr2));
        
        if(iscell(max_col_1))
            col_1 = zeros(size(max_col_1,1),size(max_col_1,2));
            col_1 = str2double(max_col_1);
        else
            col_1 = max_col_1;
        end
        
        if(iscell(max_col_2))
            col_2 = zeros(size(max_col_2,1),size(max_col_2,2));
            col_2 = str2double(max_col_2);
        else
            col_2 = max_col_2;
        end
        
        plot = scatter(col_1,col_2);
        xlabel(dataTable.Properties.VariableNames(max_attr1));
        ylabel(dataTable.Properties.VariableNames(max_attr2));
        saveas(plot,strcat(char(dataTable.Properties.VariableNames(max_attr1)),divstr,char(dataTable.Properties.VariableNames(max_attr2)),filext));
    end
end




