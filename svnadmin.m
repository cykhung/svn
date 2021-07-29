function svnadmin(varargin)


%% Execute svnadmin command.
exe = fullfile(fileparts(mfilename('fullpath')), 'svnadmin.exe');
[status, result] = dos([exe, ' ', sprintf('%s ', varargin{:})]);
if nargout == 0
    fprintf('%s\n', result);
end
if status ~= 0
    error('status ~= 0');
end


end


