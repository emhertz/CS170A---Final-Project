% This file is the top-level script for the data analysis performed
% It reads the given CSV file and creates all of the necessary data
% structures for use with any of the smaller functions.

% Stores data in the following format
% 2004 Violent Total, 2005 Violent Total, Murder, Rape, Robbery, Assault,
% 2004 Property Total, 2005 Property Total, Burglary, Larceny, Car theft
Text = importdata('CrimeRatesModified.csv');
states = Text.textdata;
Data = Text.data;

% CrimeTotals2004 will store Violent, Property total pairs
CrimeTotals2004(:, 1) = Data(:, 1);
CrimeTotals2004(:, 2) = Data(:, 7);

% Same for CrimeTotals2005
CrimeTotals2005(:, 1) = Data(:, 2);
CrimeTotals2005(:, 2) = Data(:, 8);

CombinedTotals(:, 1) = CrimeTotals2004(:, 1);
CombinedTotals(:, 2) = CrimeTotals2005(:, 1);
CombinedTotals(:, 3) = CrimeTotals2004(:, 2);
CombinedTotals(:, 4) = CrimeTotals2005(:, 2);

ViolentCrimeRates2005 = zeros(52, 4);
index = 1;
for i=3:6
    ViolentCrimeRates2005(:,index) = Data(:, i);
    index = index + 1;
end

PropertyCrimeRates2005 = zeros(52, 3);
index = 1;
for i=9:11
    PropertyCrimeRates2005(:,index) = Data(:, i);
    index = index+1;
end

SortedPropertyCrime = sort(PropertyCrimeRates2005);
SortedViolentCrime = sort(ViolentCrimeRates2005);

Top10Violent = zeros(10, 4);
for i=1:4
    Top10Violent(:,i) = SortedViolentCrime(43:52,i);
end

Top10ViolentStates = cell(10, 4);
for i=1:4
    for j=1:10
        res = find(ViolentCrimeRates2005(:,i)==Top10Violent(j,i));
        if length(res) > 1
            value = '';
            for k=1:length(res)
                if k==1
                    value = states(res(k));
                else
                    value = strcat(value, ', ', states(res(k)));
                end
            end
            Top10ViolentStates(j,i) = cellstr(value);
        else
            Top10ViolentStates(j,i) = states(res(1));
        end
    end
end      

Top10Property = zeros(10, 3);
for i=1:3
    Top10Property(:,i) = SortedPropertyCrime(43:52,i);
end

Top10PropertyStates = cell(10, 3);
for i=1:3
    for j=1:10
        res = find(PropertyCrimeRates2005(:,i)==Top10Property(j,i));
        Top10PropertyStates(j,i) = states(res(1));
    end
end  

UniversityPropertyData = zeros(8,3);
UniversityViolentData = zeros(8,4);

% CA
UniversityPropertyData(1,:) = PropertyCrimeRates2005(6,:);
UniversityViolentData(1,:) = ViolentCrimeRates2005(6,:);

% MA
UniversityPropertyData(2,:) = PropertyCrimeRates2005(23,:);
UniversityViolentData(2,:) = ViolentCrimeRates2005(23,:);

% NJ
UniversityPropertyData(3,:) = PropertyCrimeRates2005(32,:);
UniversityViolentData(3,:) = ViolentCrimeRates2005(32,:);

% CT
UniversityPropertyData(4,:) = PropertyCrimeRates2005(8,:);
UniversityViolentData(4,:) = ViolentCrimeRates2005(8,:);

% NY
UniversityPropertyData(5,:) = PropertyCrimeRates2005(34,:);
UniversityViolentData(5,:) = ViolentCrimeRates2005(34,:);

% PA
UniversityPropertyData(6,:) = PropertyCrimeRates2005(40,:);
UniversityViolentData(6,:) = ViolentCrimeRates2005(40,:);

% NH
UniversityPropertyData(7,:) = PropertyCrimeRates2005(31,:);
UniversityViolentData(7,:) = ViolentCrimeRates2005(31,:);

% NC
UniversityPropertyData(8,:) = PropertyCrimeRates2005(35,:);
UniversityViolentData(8,:) = ViolentCrimeRates2005(35,:);

SortedPropertyData = sort(UniversityPropertyData);
SortedViolentData = sort(UniversityViolentData);

Top10PropertyUni = cell(8,3);
for i=1:3
    for j=1:8
        res = find(PropertyCrimeRates2005(:,i)==SortedPropertyData(j,i));
        if length(res) > 1
            value = '';
            for k=1:length(res)
                if k==1
                    value = states(res(k));
                else
                    value = strcat(value, ', ', states(res(k)));
                end
            end
            Top10PropertyUni(j,i) = cellstr(value);
        else
            Top10PropertyUni(j,i) = states(res(1));
        end
    end
end

Top10ViolentUni = cell(8,3);
for i=1:4
    for j=1:8
        res = find(ViolentCrimeRates2005(:,i)==SortedViolentData(j,i));
        if length(res) > 1
            value = '';
            for k=1:length(res)
                if k==1
                    value = states(res(k));
                else
                    value = strcat(value, ', ', states(res(k)));
                end
            end
            Top10ViolentUni(j,i) = cellstr(value);
        else
            Top10ViolentUni(j,i) = states(res(1));
        end
    end
end

PropertyHistograms(:,1) = hist(PropertyCrimeRates2005(:,1));
PropertyHistograms(:,2) = hist(PropertyCrimeRates2005(:,2));
PropertyHistograms(:,3) = hist(PropertyCrimeRates2005(:,3));

ViolentHistograms(:,1) = hist(ViolentCrimeRates2005(:,1));
ViolentHistograms(:,2) = hist(ViolentCrimeRates2005(:,2));
ViolentHistograms(:,3) = hist(ViolentCrimeRates2005(:,3));
ViolentHistograms(:,4) = hist(ViolentCrimeRates2005(:,4));

Total2005Data(:,1) = PropertyCrimeRates2005(:,1);
Total2005Data(:,2) = PropertyCrimeRates2005(:,2);
Total2005Data(:,3) = PropertyCrimeRates2005(:,3);
Total2005Data(:,4) = ViolentCrimeRates2005(:,1);
Total2005Data(:,5) = ViolentCrimeRates2005(:,2);
Total2005Data(:,6) = ViolentCrimeRates2005(:,3);
Total2005Data(:,7) = ViolentCrimeRates2005(:,4);

normalHist = hist(sum(rand(1000,10).^2,2))';

% create plots
figure
hold on
plot(CrimeTotals2004(:,1),'r');
plot(CrimeTotals2005(:,1),'b');
legend('2004', '2005');
title('Violent Crime Totals, 2004 & 2005');
hold off

figure
hold on
plot(CrimeTotals2004(:,2),'r');
plot(CrimeTotals2005(:,2),'b');
legend('2004', '2005');
title('Property Crime Totals, 2004 & 2005');
hold off

% clear variables
clear index
clear i
clear value
clear j
clear k
clear res