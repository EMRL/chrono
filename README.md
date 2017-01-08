# Chrono

[![Code Climate](https://codeclimate.com/github/EMRL/chrono/badges/gpa.svg)](https://codeclimate.com/github/EMRL/chrono)

Chrono is project management and time tracking for design and development agencies.

## Changes

There are always ongoing tweaks happening; here are just a few things we've changed or added over the years. Many of these tasks are ongoing.

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

This will probably never be refined enough to be easily installed by anyone than us, and there's still boatloads of things hard-wired into the code that are unique to our environment. Sorry :(

If you're interested though, the original installation documentation is in [/doc/README.ORIGINAL](https://github.com/EMRL/chrono/blob/master/doc/README.ORIGINAL)

## Known Dependencies

Chrono is known working under Ruby 1.8.X (We are running 1.8.7 in production)

Additionally the following packages are required:

- ruby18-gems
- ruby18-mysql
- rubygem-rake
- ImageMagick
