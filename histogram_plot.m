dataTable = readtable('SkillCraft1_Dataset.csv');

% GapBetweenPACs
col_gap_bw_pacs = dataTable(:,13);
col_gap_bw_pacs_histogram = histogram(table2array(col_gap_bw_pacs));
xlabel('GapBetweenPACs');
ylabel('Frequency');
saveas(col_gap_bw_pacs_histogram,'GapBetweenPACs.png');

% ActionsInPAC
col_action_in_pac = dataTable(:,15);
col_action_in_pac_histogram = histogram(table2array(col_action_in_pac));
xlabel('ActionsInPAC');
ylabel('Frequency');
saveas(col_action_in_pac_histogram,'ActionsInPAC.png');



