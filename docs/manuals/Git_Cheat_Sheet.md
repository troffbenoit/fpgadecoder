###############################################################################
# Git Cheat Sheet
#
# Project:
#     FPGA 6502 Address Decoder
#
# Author:
#     Stanley Benoit
#
# Purpose:
#     Daily Git commands used for FPGA development.
#
# NASA RULE:
#     Never commit code until it builds and passes regression testing.
###############################################################################


###############################################################################
# WHERE AM I?
#
# Shows:
#   - Current branch
#   - Modified files
#   - Files waiting to be committed
###############################################################################

git status


###############################################################################
# WHAT BRANCH AM I ON?
###############################################################################

git branch


###############################################################################
# WHAT REMOTE REPOSITORY AM I USING?
###############################################################################

git remote -v


###############################################################################
# DOWNLOAD THE LATEST CHANGES FROM GITHUB
#
# Use before starting work.
###############################################################################

git pull


###############################################################################
# SHOW RECENT PROJECT HISTORY
#
# Very useful to see where branches split.
###############################################################################

git log --oneline --graph --decorate --all --max-count=15


###############################################################################
# ADD ALL CHANGED FILES
#
# Stages:
#   New files
#   Modified files
#   Deleted files
###############################################################################

git add -A


###############################################################################
# VERIFY WHAT WILL BE COMMITTED
###############################################################################

git status


###############################################################################
# CREATE A COMMIT
#
# Always use meaningful commit messages.
###############################################################################

git commit -m "Describe what changed"


###############################################################################
# SEND YOUR WORK TO GITHUB
###############################################################################

git push


###############################################################################
# SWITCH TO THE MAIN BRANCH
###############################################################################

git checkout main


###############################################################################
# SWITCH BACK TO THE BR2 DEVELOPMENT BRANCH
###############################################################################

git checkout br-v2-port


###############################################################################
# CREATE A NEW DEVELOPMENT BRANCH
#
# Example:
#   BR3
#   CPU
#   VIDEO
###############################################################################

git checkout -b new-branch-name

git push -u origin new-branch-name


###############################################################################
# MERGE A FINISHED DEVELOPMENT BRANCH INTO MAIN
#
# ONLY AFTER:
#   Build passes
#   Hardware passes
#   Documentation updated
###############################################################################

git checkout main

git pull

git merge br-v2-port

git push origin main


###############################################################################
# DISCARD CHANGES TO A FILE
#
# WARNING:
#     This permanently removes your edits.
###############################################################################

git restore filename


###############################################################################
# REMOVE A FILE FROM THE STAGING AREA
#
# Keeps your edits but removes it from the next commit.
###############################################################################

git restore --staged filename


###############################################################################
# DAILY FPGA DEVELOPMENT WORKFLOW
###############################################################################

git status

git pull

make check

git add -A

git status

git commit -m "Describe today's work"

git push

git status


###############################################################################
# PROJECT RULES
#
# 1. Build before committing.
# 2. Regression test before merging.
# 3. Update the Service Manual.
# 4. Push to GitHub often.
# 5. Never develop directly on main.
# 6. One feature per commit whenever possible.
# 7. Keep commit messages descriptive.
# 8. Preserve known-good code.
# 9. Document hardware changes.
# 10. If in doubt, STOP and make a backup.
###############################################################################

