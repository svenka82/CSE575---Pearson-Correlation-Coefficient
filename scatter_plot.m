%Scatter figure for UniqueHotkeys vs AssignToHotkeys
col_unique_hot_keys = table2array(dataTable(:,9));
col_assign_hot_keys = table2array(dataTable(:,8));

if(iscell(col_unique_hot_keys))
    col_1 = zeros(size(col_unique_hot_keys,1),size(col_unique_hot_keys,2));
    col_1 = str2double(col_unique_hot_keys);
else
    col_1 = col_unique_hot_keys;
end

if(iscell(col_assign_hot_keys))
    col_2 = zeros(size(col_assign_hot_keys,1),size(col_assign_hot_keys,2));
    col_2 = str2double(col_assign_hot_keys);
else
    col_2 = col_assign_hot_keys;
end

sc_unique_assign = scatter(col_1,col_2);
xlabel('UniqueHotkeys');
ylabel('AssignToHotkeys');
saveas(sc_unique_assign,'Unique_Assign.png');

%Scatter figure for MinimapAttacks vs. MinimapRightClicks
col_min_attacks = table2array(dataTable(:,10));
col_min_right_clicks = table2array(dataTable(:,11));

if(iscell(col_min_attacks))
    col_1 = zeros(size(col_min_attacks,1),size(col_min_attacks,2));
    col_1 = str2double(col_min_attacks);
else
    col_1 = col_min_attacks;
end

if(iscell(col_min_right_clicks))
    col_2 = zeros(size(col_min_right_clicks,1),size(col_min_right_clicks,2));
    col_2 = str2double(col_min_right_clicks);
else
    col_2 = col_min_right_clicks;
end


sc_min_right_attacks = scatter(col_1,col_2);
xlabel('MinimapAttacks');
ylabel('MinimapRightClicks');
saveas(sc_min_right_attacks,'Attacks_Clicks.png');