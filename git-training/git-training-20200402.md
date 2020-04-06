Put personal tool generated files in HOME/.gitignore
Home dir config file git config --global core.autocrlf
Home dir config file git config --global core.safecrlf
.gitattributes, look at line-ending issues Windows <-> Linux


A commit can have more than two parents (Octopus merge).

Windows -> ser core.filemode false in gitconfig to not make files executable

Always start gitk with --all to show history of all
Unless if you have a very large repository with many commits, branches, merges etc.


git diff compares staging area with work-tree.

setup diff-tool, merge-tool



unnotated tag     git tag -a (or --unannotated) RELEASES
normal tag        git tag   INTERESTED tags, 

tags are not supposed to be moved.

git describe [automated versioning]

Stackoverflow, G~ and G^, use tilde to traverse parents.

Two dot notation
A..C: Commits reachable from C but not from A
D..F: Commits reachable from F but not from D

Three dot notation
D...F: Commits reachable from D and F but not from both!

Reflog
Very good if you loose branch with commits.
git reflog HEAD
git brach restore f12783921783

Some useful features:
git stash, put all changes into a stash, restores work-tree to HEAD
git stash
git pop stash${NUMBER}
git stash list

git clean -fdx    [most used command]
clean all untracked files

git reset
soft, mixed, hard
soft = leaves staging area 
mixed = resets staging area, leaves work-tree?
hard = staging area and work-tree, only loose changes uncommitted.

git bisect
start with good and bad hash commit, then start bisecting to find bad commit

aliases

hooks

remote clones reside on different clone
i

use git remote update instead of fetch/pull.

git fetch:  you can fetch certain refs
git pull:   fetch data from remote and merge the HEAD from remote to current branch
            --rebase can be used to rebase instead of merge
            INTE köra git pull med rebase workflow

use git remote update --prune     remove local refs that are removed in remote repo

git push origin master
git push origin --delete branch-nam

WARNING: git branch origin/my-new-local-branch, branch name can have origin/ in name
          do not use this when trying to create new remote branch
          this will create local branch only

Clean History [rebase workflow]
------------------------------------
One commit should be one change.
One logical change containing all the changes. 

Look at commit log.

A commit - Atomic change
Moves software from working state to another working state
  - Bug fix
  - New feature
  - Refactoring


ONE COMMIT FOR:
  - Bugfix
  - Test
  - Refactoring

COMMIT MESSAGE:
  - Subject line "Fix a bug" -> Present tense
  - What is modified and why. Describe bug shortly.
  - Why refactor?

  - Commit message should not tell how changes were made.

Task branches [WIP - Work In Progress]
--------------------------------------
Review and CI findings are worked on in WIP branch / task branch.
Squash fixes to commits containing the actual change.

Cherry Pick
-------------
Cherry pick certain commits from task branch into master branch
Cherry pick Master..C, would pick commit A, B, C.

Commit Amend
---------------
git commit --amend
-> Looks like u are editing HEAD commit.
-> git commit --amend --no-edit   [keep old commit message]

Rebase
--------------
Cherry Pick in the other direction

Takes commits from task branch and puts them in front of HEAD in master branch

git rebase cherry-picked / HASH

git rebase bitbucket/origin/master

one pitfall is to rebase on top of your local master


Interactive Rebase
-----------------------
Select which commit to ?

git rebase -i <ref>

git commit --fixup=HASH of the commit....

git rebase -i origin/master --autosquash
go with fixup way

refactoring before implementation in code review

conflics if refactor afterwards....

REMEMBER TO CLEAN COMMITS BEFORE REBASE
git rebase --abort


Tools
--------------
git grep \!




