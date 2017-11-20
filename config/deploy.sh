#!/bin/bash
#
# Here are examples of settings you might need to change on a per-project 
# basis. This file should be placed in config/deploy.sh in your projects' 
# root folder. Project settings will override both system & per-user settings.
# 
# If any value set here will override both global and per-user settings.

# The URL for this repo's hosting, with no trailing slash. For example, if 
# you use Github and your repo URL looks like https://github.com/EMRL/deploy
# your REPOHOST should be set to https://github.com/EMRL (with no trailing slash)
# If most of your repos are all hosted at the same location, you may want to define
# this in either the global or user configuration files.
REPOHOST="https://github.com/emrl"

# If you have no SSH key or wish to login manually using your account name and
# password in the console, set NOKEY to exactly "TRUE"
NOKEY="TRUE"

# By default deploy will check for valid SSH keys; if you want to override this
# behavior, set DISABLESSHCHECK to TRUE
# DISABLESSHCHECK="FALSE"

# A human readable project name
PROJNAME="Chrono Project Management"	

# A human readable client name
PROJCLIENT="EMRL"

# If you are using html logfiles, define the full URL to the client's logo
CLIENTLOGO="https://pbs.twimg.com/profile_images/952484649/Chrono_Icon_Small_400x400.jpg"

# First and last name of the primary contact for this client 
# CLIENTCONTACT="First Last"

# If you'd like to send branded HTML emails using the `deploy --digest [project]` 
# command, enter the recipient's email address below. Email value can be a comma 
# separated string of multiple addresses. 
# DIGESTEMAIL="deploy@emrl.com"

# If you are using a digest theme that includes a cover image, at the URL below.
# DIGESTCOVER="http://client.com/assets/img/cover.jpg"

# If you'd like to post a Slack notification with a URL to view the weekly digest  
# set the following to TRUE. IF you want to use an incoming webhook other than the 
# one defined in SLACKURL below, enter that here *instead* of TRUE.
DIGESTSLACK="TRUE"

# If you want to use an email template unique to this project (instead of the 
# globally configured template) define it below. HTML templates are stored in 
# separate folders in /etc/deploy/html. The value used below should be the 
# folder name of your template.
# HTMLTEMPLATE="mui"

# Development project URL, including http:// or https:// 
DEVURL="https://github.com/EMRL/chrono"

# Production, or "Live" project URL, including http:// or https://
PRODURL="https://projects.emrl.com"

# The exact name of the Bitbucket/Github repository
REPO="chrono"

# Advanced Custom Fields Pro License
#
# Too many issues seem to crop up with the normal method of updating the Wordpress 
# plugin Advanced Custom Fields Pro. Including your license key below will enable 
# upgrades to happen more reliably.
# ACFKEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

# Configure your branches. In most cases the name will be master & production. If
# you are only using a master branch, leave production undefined.
MASTER="master"
#PRODUCTION="production"

# Configure merge behavior. If you wish to automatically merge your MASTER and 
# PRODUCTION branches when deploying, set AUTOMERGE to TRUE.
# AUTOMERGE="TRUE"

# If dirty (yet to be committed) files exist in the repo, deploy will normally not halt
# execution when running with the --automate flag. If you prefer to have the dirty files 
# stashed and proceed with updates set the below value to TRUE. Files will be unstashed
# after the deployment is complete.  
# STASH="TRUE"

# Define CHECKBRANCH if you only want deploy to run when the set branch is 
# currently checked out; e.g. if CHECKBRANCH="master" and the current branch is 
# "production", deployment will halt.
CHECKBRANCH="master"

# If for some reason you'd like a default commit message. It will
# always be editable before finalizing commit.	
# COMMITMSG="This is a default commit message"

# Wordpress configuration
#
# Some developers employ a file structure that separates Wordpress core from 
# their application code. If you're using non-standard file paths, define the 
# root, system, and app (plugin/theme) directories below. Note that the forward
# slash is required. Just about everyone on the planet can leave this alone.
# WPROOT="/public"
# WPAPP="/app"
# WPSYSTEM="/system"

# The command to finalize deployment of your project(s)
# DEPLOY="mina deploy"				

# To require approval before pushing this project's code to a live production
# environment, set REQUIREAPPROVAL="TRUE"
# REQUIREAPPROVAL="TRUE"

# If this project needs logs mailed to an address other than the one configured
# globally, set it below. 
# TO="deploy@emrl.com"

# Disallow deployment; set to TRUE to enable. Double negative, it's tricky.
# DONOTDEPLOY="TRUE"	

# Integration ID
#
# This is used to post deploy logs to project management systems that can 
# external email input. For examples, for our task management system 
# accepts emails in the format task-####@projects.emrl.com, with the #### 
# being the task identification number for the project being deployed.
TASK="3332"

# If you wish to have automated deployments add tracked time to your project 
# management system, uncomment and configure the two values below. TASKUSER 
# should be the email address of the user that the time will be logged as,
# and ADDTIME is the amount of time to be added for each deployment. Time 
# formats can in hh:mm (02:23) or HhMm (2h23m) format.
TASKUSER="deploy@emrl.com"
ADDTIME="30m"

# Slack Integration
#
# You'll need to set up an "Incoming Webhook" custom integration on the Slack
# side to get this ready to roll.
# See https://YOURTEAMNAME.slack.com/apps/manage/custom-integrations to get
# going. Once your Slack webhook is setup, run # 'deploy --slack-test' to
# test your configuration.
#
# Set POSTTOSLACK to "TRUE" to enable Slack integration.
POSTTOSLACK="TRUE"

# Add your full Webhook URL below, including https://
#SLACKURL="https://hooks.slack.com/services/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"

SLACKURL="https://hooks.slack.com/services/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"

# Normally only successful deployments are posted to Slack.
# Enable the settings below to post on WARNiNG and/or ERROR.
SLACKERROR="TRUE"

# Post commit logs to this URL.
#POSTURL="http://webhook.site/0f724483-236e-4001-b7ec-a508881d8864"
POSTURL="https://hooks.zapier.com/hooks/catch/415258/ix8zkg/"

# Google Analytics
#
# API credentials
# CLIENTID="#############################################.apps.googleusercontent.com"
# CLIENTSECRET="########################"
# REDIRECTURI="http://localhost"

# OAuth authorization will expire after one hour, but will be updated when needed
# if the tokens below are configured correctly
# AUTHORIZATIONCODE="##############################################"

# Tokens
# ACCESSTOKEN="#################################################################################################################################"
# REFRESHTOKEN="##################################################################"

# Google Analytics ID
# PROFILEID="########"
