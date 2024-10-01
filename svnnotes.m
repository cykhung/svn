%% Get SVN.ZIP From GitHub
%
% * unzip https://github.com/cykhung/svn/archive/refs/heads/master.zip .


%% Get SVN.ZIP From Google Drive
%
% * Zip up all files.
%   >> zip svn.zip v:\khung\svn\trunk
%
% * Upload svn.zip to Google Drive.
%
% * Go to https://sites.google.com/site/gdocs2direct and follow the
%   instructions to create a downloadable link.
%
% * >> websave('svn.zip', 'https://tinyurl.com/4wa2pbbj', weboptions('Timeout', 1e3))
%
% * >> unzip svn.zip


%% Perforce Helix
%
% * >> svn ls -v https://helixteamhub.cloud/mulberry/projects/kevin/repositories/subversion/tmp --username=cykhunggmailcom --password=J7w2y5B-Yn
%
% * >> svn co https://helixteamhub.cloud/mulberry/projects/kevin/repositories/subversion/tmp tmphelix


%% Relocate
%
% * >> svn relocate '"file://mathworks/salesservice/training_services/Course Development/BOReports/Course_History_From_SFDC/khung/svnrepos-test123"'
%
% * >> svn relocate file:///V:/khung/svnrepos-usbtest


%% Modify Commit Log Message
%
% * >> svnadmin setlog v:\khung\svnrepos-test123 --bypass-hooks -r 2 log.txt
%
% * After running the above command, you need to update cache in Tortoise (if
%   log caching is enabled).


%% Resurrect Deleted Files/Folders
%
% * Resurrect deleted file and keep history.
%
%   >> svn copy file:///V:/khung/svnrepos-skunk/trunk/startup.m@807 startup.m
%   >> svn commit -m "Resurrect startup.m from revision 807."
%   
% * Resurrect deleted file but do not want to keep history.
%
%   >> svn cat file:///V:/khung/svnrepos-skunk/trunk/startup.m@807 > startup.m
%   >> svn add startup.m
%   >> svn commit -m "Resurrect startup.m from revision 807 but no history."
%    
% * Resurrect deleted folder but do not want to keep history.
%
%   'test' is a folder with 2 files and the entire folder (with its 2 files) is
%   deleted in revision 4341.
%
%   >> svn export file:///V:/khung/svnrepos-skunk/trunk/test@4340 test
%
% * Resurrect deleted file and keep history. Directly done to the repository.
%
%   >> svn rm file:///V:/khung/svnrepos-skunk/trunk/startup.m -m "Delete file."
%
%   >> svn copy file:///V:/khung/svnrepos-skunk/trunk/startup.m@807     ...
%            file:///V:/khung/svnrepos-skunk/trunk/startup.m             ...
%            -m "Resurrect startup.m from revision 807."


%% How does Subversion handle binary files?
% 
% * https://subversion.apache.org/faq.html#binary-files
% 
% % pp. 431 of svn book (>> svnbook).


%% Ignore
% 
% * global-ignores: In pp. 231 of svn-book-1p7.pdf, it says,
% 
%       The default value is *.o *.lo *.la *.al .libs *.so *.so.[0-9]* *.a 
%       *.pyc *.pyo *.rej *~ #*# .#* .*.swp .DS_Store.
%
% * Tortoise Subversion Global ignore pattern:
%       *.o *.lo *.la *.al .libs *.so *.so.[0-9]* *.a *.pyc 
%       *.pyo __pycache__ *.rej *~ #*# .#* .*.swp .DS_Store [Tt]humbs.db
%
% * https://stackoverflow.com/questions/86049/how-do-i-ignore-files-in-subversion
% 
% * >> edit C:\Users\khung\AppData\Roaming\Subversion\config
% 
% * >> svn add --no-ignore . --force
% 
% * >> svn st . --no-ignore

 
%% Authentication
% 
% * >> getenv('appdata')
%
% * >> ll c:\Users\khung\AppData\Roaming\Subversion\auth
%
% * >> svn up . --username cykhung --password KevinHung2001
%
% * Do not save password.
%   >> svn up . --username cykhung --password KevinHung2001 --no-auth-cache


%% Backup a Remote SVN Repository
% 
% * https://stackoverflow.com/questions/2302592/how-do-i-back-up-a-remote-svn-repository
% 
% * Create a brand new repository on local c:\ drive.
% 
%   >> svnadmin('create v:\khung\svnrepos-ashlandroboticsclub')
% 
% * Create a file named pre-revprop-change.bat.
% 
%   >> dos('echo exit 0 > v:\khung\svnrepos-ashlandroboticsclub\hooks\pre-revprop-change.bat')
% 
% * Initialize the sync on the local repository.
% 
%   >> svnsync('init file:///V:/khung/svnrepos-ashlandroboticsclub https://subversion.assembla.cm/svn/ashlandroboticsclub')
% 
% * Incremental sync. Run this command periodically to backup repository.
% 
%   >> svnsync('sync file:///V:/khung/svnrepos-ashlandroboticsclub')


%% Import Existing SVN Repository From Assembla To SlikSVN
% 
% * https://sliksvn.com/support/import-subversion-repository
% 
% * Initialize the sync on SlikSVN repository.
% 
%   >> svnsync('init https://svn.sliksvn.com/ashlandroboticsclub https://subversion.assembla.com/svn/ashlandroboticsclub')
% 
% * Copy
%
%   >> svnsync('sync https://svn.sliksvn.com/ashlandroboticsclub')

 
%% TortoiseSVN Settings
% 
% * Diff Viewer
% 
%     * Configure the program used for comparing different revisions of files
% 
%         * Select "External"
% 
%         * V:\khung\winmerge\trunk\private\winmerge-2.16.0.0\WinMergeU.exe -e -ub -dl %bname -dr %yname %base %mine
% 
%     * Configure the program used for comparing different revisions of properties
% 
%         * Select "External"
% 
%         * V:\khung\winmerge\trunk\private\winmerge-2.16.0.0\WinMergeU.exe -e -ub -dl %bname -dr %yname %base %mine


%% Export
% 
% *  Export a single file at a particular revision.
% 
%   >> svn export -r1478 file:///V:/khung/svnrepos-skunk/trunk/startup.m startup_r1478.m
%
%   >> svn export file:///V:/khung/svnrepos-skunk/trunk/startup.m@1478 startup_r1478.m
%
%   >> svn cat file:///V:/khung/svnrepos-skunk/trunk/startup.m@1478 > startup_r1478.m

 
%% Download SVN DOS Executables
% 
% * Subversion 1.11.1 DOS Executables
% 
%     https://www.visualsvn.com/downloads
% 
%     https://www.visualsvn.com/files/Apache-Subversion-1.11.1.zip

