[![Code Climate](https://codeclimate.com/github/rails/rails/badges/gpa.svg)](https://codeclimate.com/github/rails/rails)
# litteBits - Showcase App by John Perkins

This application was developed to demonstrate the coding style and practices of John Perkins.  This is to be used as a technical evaluation.

Installation
-----------
This application was built using Ruby version 2.3.3 and Rails version 5.0.1.  The application employs a number of 3rd party tools and services.

##Prerequisites
You will need to install postgres and setup Amazon AWS S3 for photo and video upload as well as [Telestream | Cloud accounts](http://www.telestream.net/) for video encoding and streaming services.

1. rvm use 2.3.3@littlebits --ruby-version --create
2. gem install bundler
3. git clone git@github.com:jeperkins4/littlebits.git
4. bundle install

Demo Version
-----------
You can explore a working version of this software at [litteBits Showcase](http://littlebits-showcase.herokuapp.com).

* System dependencies
telestream
Amazon AWS S3 with bucket named littlebits

* Configuration

* Database creation
bundle exec rake db:create

* Database initialization
bundle exec rake db:migrate

* How to run the test suite
bundle execute rake spec

* Services (job queues, cache servers, search engines, etc.)
bundle exec sidekiq -q default -c 5

* Deployment instructions
A heroku pipeline is already configured so that pushes to the master branch will automatically deploy to heroku.

* ...
