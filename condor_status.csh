#!/bin/csh 
#-xvf

mkdir -p ../REG_RES
#grep "status:" OutLinux4.* >! ../REG_RES/$USER.result
grep "Regression_status :" OutLinux4.* >! ../REG_RES/$USER.result

set SKIPPED = `grep ":SKIPPED" ../REG_RES/$USER.result |wc -l `
set ERROR = `grep ":ERROR" ../REG_RES/$USER.result |wc -l `
set FAILED = `grep ":FAILED" ../REG_RES/$USER.result |wc -l `

set PASSED = `grep ": PASSED" ../REG_RES/$USER.result |wc -l `
grep ": SKIPPED" ../REG_RES/$USER.result >! ../REG_RES/SKIPPED
set SKIPPED = `cat ../REG_RES/SKIPPED |wc -l `
grep ": ERROR" ../REG_RES/$USER.result >! ../REG_RES/ERROR
set ERROR = `cat ../REG_RES/ERROR |wc -l `
grep ": FAILED" ../REG_RES/$USER.result >! ../REG_RES/FAILED
set FAILED = `cat ../REG_RES/FAILED|wc -l `

set CRASH = `grep ": CRASH" ../REG_RES/$USER.result |wc -l `
set KNOWNFAIL = `grep ": KNOWN-FAIL" ../REG_RES/$USER.result |wc -l `
set FAILFORSAVE = `grep ": FailForSaveIssue" ../REG_RES/$USER.result |wc -l `
set OTHERS = `grep "status:" ../REG_RES/$USER.result  | grep -v PASSED | grep -v SKIPPED | grep -v FAILED |grep -v CRASH | grep -v ERROR |grep -v KNOWN-FAIL |  grep -v FailForSaveIssue |wc -l `
set TOTAL = `grep "status :" ../REG_RES/$USER.result  |wc -l `



echo "PASSED:$PASSED"
echo "FAILED:$FAILED"
echo "ERROR:$ERROR"
echo "SKIPPED:$SKIPPED"
echo "CRASH:$CRASH"
echo "KNOWNFAIL:$KNOWNFAIL"
echo "FailForSaveIssue:$FAILFORSAVE"
echo "OTHERS:$OTHERS"
echo "---------------------"
echo "TOTAL:$TOTAL"
