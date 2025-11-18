@echo off
echo ========================================
echo ClimaLogic - GitHub Push Script
echo ========================================
echo.

echo Step 1: Please create the repository on GitHub first:
echo.
echo 1. Go to: https://github.com/new
echo 2. Repository name: ClimaLogic
echo 3. Choose Public or Private
echo 4. DO NOT check any initialization options
echo 5. Click "Create repository"
echo.
pause

echo.
echo Step 2: Pushing code to GitHub...
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Code pushed to GitHub!
    echo ========================================
    echo.
    echo Repository: https://github.com/l1-NovaHunter/ClimaLogic
    echo.
) else (
    echo.
    echo ========================================
    echo ERROR: Push failed
    echo ========================================
    echo.
    echo Make sure:
    echo 1. Repository exists on GitHub
    echo 2. You have push permissions
    echo 3. Internet connection is working
    echo.
)

pause

