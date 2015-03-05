# ruby.sg

[![Build Status](https://travis-ci.org/rubysg/rubysg-reboot.png?branch=master)](https://travis-ci.org/rubysg/rubysg-reboot) [![Code Climate](https://codeclimate.com/github/rubysg/rubysg-reboot.png)](https://codeclimate.com/github/rubysg/rubysg-reboot)

This is the app for [ruby.sg](http://ruby.sg), rebooted - a community site for the Singapore Ruby Community!


## Contributing to ruby.sg

ruby.sg needs your help and we would love to see contributions from anyone in the community.

Please refer to the [GitHub Issues](https://github.com/rubysg/rubysg-reboot/issues) for details on features/bugs/chores that you can help with.

You can also raise feature requests, or bug reports on GitHub Issues.

The initial design of ruby.sg was done by @winstonyw who is not a designer by training. :)


## Setup of Development Environment

### .env

You'll need to have a `.env` file ready in your app directory with the following keys:

```
SLACK_TEAM
SLACK_CHANNELS
SLACK_TOKEN
```

Read this blog post for more details: https://levels.io/slack-typeform-auto-invite-sign-ups/

### Postgres

The easiest way to get it working on a Mac is with http://postgresapp.com/.

### bin/setup

Run `bin/setup` to install Gems and also setup your database.

### Run Specs

Run `spring rspec`.


## Workflow

Fork the app, checkout a branch, work on a feature/bug/chore and submit it as a Pull Request.

### Core Contributors

I'll be adding folks as core contributors to the repo too when you chalk up enough contributions.

As a core contributor, you'll get access to the repo and can help with review/management of PRs.
You'll also be listed in this readme as a core contributor and possibly get deployment rights in the future.

### Voluntary Contributors

Just start writing code (with tests if possible). Make a Pull Request when you are done.

Help with typos, design tweaks etc! The core contributors will review and merge in your PRs.

## Testing

All features/bug fixes should come with tests. We're using RSpec.

To run tests, just run `rake` or `rspec` on console.

## Deployment

The app is currently deployed on Heroku. No fuss. No thrills.

## Questions

Please feel free to email me winstonyw@gmail.com.
