alias svnadd='svn status | grep -v "^.[ \t]*\..*" | grep "^?" | awk "{print $2}" | xargs svn add'
alias svnrevert='svn status | grep -v "^.[ \t]*\..*" | grep "^M" | awk "{print $2}" | xargs svn revert'
