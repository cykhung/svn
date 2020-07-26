function svn(varargin)

%% Set svnexe.
svnexe = fullfile(fileparts(mfilename('fullpath')), 'svn.exe');

%% Execute svn command.
cmd = [svnexe, ' ', sprintf('%s ', varargin{:})];
[status, result] = dos(cmd);
fprintf('%s\n', result);
if status ~= 0
    error('status ~= 0');
end

end

