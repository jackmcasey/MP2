function sel = selector(select)
% Function to calculate the central body of plot
% Input select = state of radio button group to select central body
% Output sel = integer for further use in plotting

% --------------------------------------------------------------
% Switch statement to return corresponding integer
    switch select.SelectedObject.Text
        case 'Sun'
            sel = 1;
        case 'Mercury'
            sel = 2;
        case 'Venus'
            sel = 3;
        case 'Earth'
            sel = 4;
        case 'Mars'
            sel = 5; 
        case 'Jupiter'
            sel = 6;
        case 'Saturn'
            sel = 7;
        case 'Uranus'
            sel = 8;
        case 'Neptune'
            sel = 9;
        case 'Pluto'
            sel = 10;
        otherwise       % Default centre is Sun
            sel = 1;
    end
end
