[![CircleCI](https://circleci.com/gh/jeperkins4/littlebits/tree/develop.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/jeperkins4/littlebits/tree/develop)
[![Code Climate](https://codeclimate.com/repos/5882322acafcb50053000704/badges/4e3e85e07f4ae2943fe3/gpa.svg)](https://codeclimate.com/repos/5882322acafcb50053000704/feed)
# litteBits - Showcase App by John Perkins

This application was developed to demonstrate the coding style and practices of John Perkins.  This is to be used as a technical evaluation.

Installation
-----------
This application was built using Ruby version 2.3.3 and Rails version 5.0.1.  The application employs a number of 3rd party tools and services.

###Prerequisites
You will need to install postgres, redis and setup Amazon AWS S3 for photo and video upload as well as [Telestream | Cloud accounts](http://www.telestream.net/) for video encoding and streaming services.

1. rvm use 2.3.3@littlebits --ruby-version --create
2. gem install bundler
3. git clone git@github.com:jeperkins4/littlebits.git
4. bundle install

###Environment Variables
In order to run the application in your local development environment, you will need to add your own .env file and add the following:

```shell
PANDASTREAM_URL=YOURPANDAURL
S3_BUCKET=YOURS3BUCKET
S3_KEY=YOURAWSS3KEY
S3_PASSWORD=YOURAWSS3PASSWORD
```

###Setup
Once you've completed the prerequisites and set the Environment Variables, you may continue by running the following:

```ruby
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

###Running the Application
You will need to make sure redis server and postgres are running.  In addition to running the rails server, you will also need to run sidekiq.

```ruby
$ rails s
$ bundle exec sidekiq -q default
```

Demo Version
-----------
You can explore a working version of this software on Heroku at [litteBits Showcase](http://littlebits-showcase.herokuapp.com).  If you register so that you can create and edit inventions, please be aware that email during registration may get sent to junk folders due to the sender address being used.

###TODO
Obviously this is not a production application, but a number of backend and infrastructure issues would need to be addressed.
1. Improve video upload - Most likely a direct to S3 type solution to bypass the blocking / timeouts of the current solution.
2. Resolve CircleCI issue to allow continuous integration and enforce only passing tests moving code into production.
3. Better messaging around long or asynchronous transactions.  There is a superficial attempt at ActionCable integration, but this would need to be enhanced.
4. A more usable and branded UX.

