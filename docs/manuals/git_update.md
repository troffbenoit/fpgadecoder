###############################################################################
# DAILY GIT WORKFLOW
###############################################################################

# 1. See what changed
git status

# 2. Stage everything
git add -A

# 3. Verify exactly what will be committed
git status

# 4. Create the commit
git commit -m "Describe today's work"

# 5. Upload to GitHub
git push

# 6. Verify you're clean
git status


# check all branches
git log --oneline --graph --decorate --all --max-count=20

# sync main 
git checkout main
git merge br-v2-port
git push origin main
git checkout br-v2-port
git status

