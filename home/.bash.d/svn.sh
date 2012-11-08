alias svnadd='svn status | grep -v "^.[ \t]*\..*" | grep "^?" | awk "{print $2}" | xargs svn add'
alias svnrevert='svn status | grep -v "^.[ \t]*\..*" | grep "^M" | awk "{print $2}" | xargs svn revert'

# http://www.commandlinefu.com/commands/view/153/add-all-unversioned-files-to-svn
alias svnra='svn st | grep "^\!" | awk "{print \$2}" | xargs svn rm $1'
