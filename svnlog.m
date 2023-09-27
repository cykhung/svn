function varargout = svnlog(varargin)

%%
%       SYNTAX: svnlog
%               svnlog(L)
%               svnlog(top)
%               svnlog(top, L)
%               svnlog(top, L, logfilename)
%               result = svnlog(...);
%
%  DESCRIPTION: Show SVN log messages.
%
%        INPUT: - top (char)
%                   Top-level folder or a single file name. Default = '.'.
%
%               - L (double or char)
%                   Maximum number of log entries to display. Use Inf for all
%                   log entries. Default = Inf.
%
%               - logfilename (char)
%                   Log filename. If this input variable is defined, then this
%                   function will Write log entries into log file and
%                   automatically open the file in MATLAB Editor. Do not display
%                   log entries in the MATLAB Command Window.
%
%       OUTPUT: - result (string)
%                   Result from running svn log command.


%% Assign input argument.
top         = '.';
L           = Inf;
logfilename = '';
switch nargin
case 0
    % Do nothing.
case 1
    tmp = str2double(varargin{1});
    if isnan(tmp)
        top = varargin{1};
    else
        L = tmp;
    end
case 2
    top = varargin{1};
    L   = varargin{2};
case 3
    top         = varargin{1};
    L           = varargin{2};
    logfilename = varargin{3};
otherwise
    error('Invalid number of input arguments.');
end
if ischar(L)
    L = str2double(L);
    if isnan(L)
        error('Invalid L.');
    end
end


%% Find the latest revision in local workspace.
r = findlatestversion(top);


%% Call svn log.
cmd = sprintf('log "%s" -v -r%d:1', top, r);
if ~isinf(L)
    cmd = [cmd, sprintf(' -l %d', L)];
end
if ~isempty(logfilename)
    cmd = [cmd, sprintf(' > %s', logfilename)];
end
% fprintf('%s\n', cmd);
result = svn(cmd);


%% Display result.
if isempty(logfilename)
    varargout = {result};
else
    varargout = {};
    edit(logfilename)
end


end



function r = findlatestversion(top)

r = svnversion(sprintf('"%s" --no-newline', top));
r = strrep(r, 'M', '');
if contains(r, ':')
    r = strsplit(r, ':');
    r = str2double(r{2});
else
    r = str2double(r);
end
if isnan(r)
    error('Cannot get revision number.');
end

end


% function r = findlatestversion(top)
% 
% 
% %%
% x   = svn(sprintf('info "%s"', top));
% x   = strsplit(x, '\n');
% url = x(startsWith(x, 'URL: '));
% url = strrep(url, 'URL: ', '');
% url = url{1};
% 
% 
% %%
% x = svn(sprintf('info "%s"', url));
% x = strsplit(x, '\n');
% r = x(startsWith(x, 'Revision: '));
% r = strrep(r, 'Revision: ', '');
% r = str2double(r);
% 
% 
% end

