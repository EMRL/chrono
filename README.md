# Chrono

[![Build Status](https://travis-ci.org/EMRL/chrono.svg?branch=master)](https://travis-ci.org/EMRL/chrono) [![Code Climate](https://codeclimate.com/github/EMRL/chrono/badges/gpa.svg)](https://codeclimate.com/github/EMRL/chrono)

Chrono is project management and time tracking for design and development agencies.

![Chrono screenshot](https://raw.githubusercontent.com/EMRL/chrono/master/public/images/chrono.png
)

## Changes

Chrono is based on [ClockingIT](http://clockingit.com); here are just a few things we've changed or added over the years. Many of these tasks are ongoing.

1. Improved user interface
2. Replaced UI .gif & .png graphics with [Font Awesome](http://fontawesome.github.io/Font-Awesome/3.2.1/) icons (still on version 3 for now)
3. Improved calendar grid layout
4. Improved report printing
5. Added inline reply to task comments
6. Improved many widgets
7. Improved news/announcement display
8. Added start dates to tasks
9. Cleaned up many of the system email templates
10. Added a "Don't send me my own comments" option to cut down on spam
11. Added an "Out for Approval" flag for tasks that are waiting for client approval before proceeding further

## Installation

For the moment, installation is an undocumented mess, but semi-legible CentOS 7 installation instructions are [available here](https://github.com/EMRL/chrono/wiki/CentOS-7-Install). 

Original installation documentation is in [/doc/README.ORIGINAL](https://github.com/EMRL/chrono/blob/master/doc/README.ORIGINAL) although installing Chrono successfully will follow a different workflow.

## Source Contents
```
app
  Holds all the code that's specific to this particular application.

app/controllers
  Holds controllers that should be named like weblog_controller.rb for
  automated URL mapping. All controllers should descend from
  ActionController::Base.

app/models
  Holds models that should be named like post.rb.
  Most models will descend from ActiveRecord::Base.

app/views
  Holds the template files for the view that should be named like
  weblog/index.rhtml for the WeblogController#index action. All views use eRuby
  syntax. This directory can also be used to keep stylesheets, images, and so on
  that can be symlinked to public.

app/helpers
  Holds view helpers that should be named like weblog_helper.rb.

config
  Configuration files for the Rails environment, the routing map, the database, and other dependencies.

components
  Self-contained mini-applications that can bundle together controllers, models, and views.

db
  Contains the database schema in schema.rb.  db/migrate contains all
  the sequence of Migrations for your schema.

doc
  Minor documenation

lang
  Translations
  
lib
  Application specific libraries. Basically, any kind of custom code that doesn't
  belong under controllers, models, or helpers. This directory is in the load path.

public
  The directory available for the web server. Contains subdirectories for images, stylesheets,
  and javascripts.

script
  Helper scripts for automation and generation.

test
  Unit and functional tests along with fixtures.

vendor
  External libraries that the application depends on. Also includes the plugins subdirectory.
  This directory is in the load path.
 ```
