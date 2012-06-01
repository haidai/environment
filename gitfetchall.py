#! /usr/bin/python
import subprocess as sb
import os
sb.Popen(['pwd'], shell=True)

b = sb.Popen(['git','branch'], stdout=sb.PIPE)
uc_branches = b.stdout.readlines()
print uc_branches
if b.poll() != 0:
    print 'error with branch'
    exit()

ret = os.system('git fetch --all')
if ret != 0:
    print 'error with fetch', ret
    exit()

branches = []
for branch in uc_branches:
    branch = branch.strip()
    if branch[0] == '*':
        branch = branch[1:].strip()
    astr = 'git checkout ' + branch
    print '====================================================='
    print astr
    if 0 != os.system(astr):
        print 'error'
        exit()

    bstr = 'git merge origin/' + branch
    print bstr
    if 0 != os.system(bstr):
        print 'error'
        exit()


