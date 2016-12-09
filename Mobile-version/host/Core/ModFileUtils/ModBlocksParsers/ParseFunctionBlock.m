function [name, formal_params, body] = ParseFunctionBlock(scope)

    formal_params = {};

    body = scope;

    for i = 1 : length(scope)
        line = scope{i};
        if strfind(line, 'FUNCTION')

            left_idx = strfind(line, 'FUNCTION');
            left_idx = left_idx(end) + length('FUNCTION');

            right_idx = strfind(line, '(');
            right_idx = right_idx(1) - 1;

            name = regexprep(line(left_idx : right_idx), '\s*', '');

            tmpStr = strsplit(line, '{');
            tmpStr = tmpStr{1};

            left_idx = strfind(tmpStr, '(');
            left_idx = left_idx(1) + 1;

            right_idx = strfind(tmpStr, ')');
            right_idx = right_idx(end) - 1;

            tmpStr = strsplit(tmpStr(left_idx : right_idx), ',');

            for j = 1 : length(tmpStr)
                formal_params{end + 1, 1} = regexprep(tmpStr{j}, {'\(\S*\)', '\s*'}, '');
            end

            break
        end
    end
end