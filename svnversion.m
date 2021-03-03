function svnversion(varargin)


%% Get absolute path of svnversion.exe.
svnver   = '1.8.5';
switch svnver
case '1.8.5'
    svnexe = fullfile(fileparts(mfilename('fullpath')), 'svnversion.exe');
otherwise
    error('Invalid svnver.');
end


%% Execute svnversion command.
[status, result] = dos([svnexe, ' ', sprintf('%s ', varargin{:})]);
if nargout == 0
    fprintf('%s\n', result);
end
if status ~= 0
    error('status ~= 0');
end


end
