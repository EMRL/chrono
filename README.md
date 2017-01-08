# Chrono

[![Code Climate](https://codeclimate.com/github/EMRL/chrono/badges/gpa.svg)](https://codeclimate.com/github/EMRL/chrono)

Chrono is project management and time tracking for design and development agencies.

## Changes

Chrono is based on [Clockingit] (http://clockingit.com); here are just a few things we've changed or added over the years. Many of these tasks are ongoing.

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

### Step 1: Prerequisites

Chrono requires Ruby 1.8.X. We are running 1.8.7 in production; newer versions beyond 1.9.X will fail.

Additionally the following packages are required:

- ruby18-gems
- ruby18-mysql
- rubygem-rake
- ImageMagick

Use your favourite package manager to ensure you have the above components installed.

### Step 2: Phusion Passenger & Apache

Install [Phusion Passenger] (http://www.modrails.com/install.html).

Naturally you'll want to be running Apache httpd and have an appropriate virtual host set up. See configuration examples below.

**Basic Apache configuration**
```
  <VirtualHost *:80>
    ServerName chrono.domain.com
    DocumentRoot /path/application/public/
    ErrorLog /path/application/log/server.log

    <Directory /path/application/public/>
      Options ExecCGI FollowSymLinks
      AllowOverride all
      Allow from all
      Order allow,deny
    </Directory>
  </VirtualHost>
```

**Example for mod_rewrite Apache configuration**

This will redirect requests for http://chrono.domain.com to https://chrono.domain.com
and will proxy requests for https://chrono.domain.com to http://chrono.domain.com:3000 on the localhost
The end-user who is contacting chrono.domain.com does not know that the request is being proxied, because apache will change the "Host:" values to itself as it sends back the response. The proxy request is performed on the localhost, which is informed by /etc/hosts that hostname.clockingit.com points to 127.0.0.1
```
  ### Insecure VirtualHost ###
  <VirtualHost *:80>
    ServerAdmin root@domain.com
    ServerName server.domain.com
    UseCanonicalName Off
    # Force clients from the Internet to use HTTPS
    RewriteEngine on
    RewriteRule ^/?(.*)$ https://chrono.domain.com/$1 [L,R]
  </VirtualHost>

  ### SSL VirtualHost ###
  <VirtualHost *:443>
    ServerAdmin root@domain.com
    ServerName chrono.domain.com
    UseCanonicalName Off
    SSLCertificateFile /path/to/cert/ssl.cert.pem
    SSLCertificateKeyFile /path/to/cert/ssl.key.pem

    ProxyRequests Off
    <Proxy *>
      Order Allow,Deny
      Allow from all
    </Proxy>

    RewriteEngine On
    RewriteRule ^/(.*)$ http://chrono.domain.com:3000/$1 [P,NC]
    ProxyPassReverse / http://chrono.domain.com:3000/
  </VirtualHost>
```

### Step 3: Setup configuration and database
```
ruby setup.rb
```

### Step 4: Ruby gems

There are a few Ruby gems which are needed for running Chrono. Change directory into the top of your installation, then type:
```
rake gems:install
```

### Step 5: Start Daemons

To start Chrono:
```
cd /path/to/chrono
nohup ./script/push_server &
./script/ferret_server -e production start
apachectl restart
```

To kill running daemons:
```
ps ax | grep ruby
```

## Setting up Email Integration

Assuming that you already have your DNS and MX records set correctly, configure sendmail to pass all emails sent to chrono.domain.com to Chrono so that replies can go back to the task.

Add an entry to /etc/mail/local-host-names to contain your domain:

```
chrono.domain.com
```

Add an entry to /etc/mail/aliases to create an alias that will hand off emails to the mailman script:

```
cit: "|/path/to/chrono/script/runner -e production 'Mailman.receive(STDIN.read)'"
```

Add an entry to /etc/mail/virtusertable to redirect all emails to your domain to the above alias:

```
@domain.com        chrono
```

Then, run the following:

```
cd /etc/mail; make; make restart
```

## Configure Apache


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
