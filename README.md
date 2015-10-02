# ruby.sg

[![Build Status](https://travis-ci.org/rubysg/rubysg-reboot.svg?branch=master)](https://travis-ci.org/rubysg/rubysg-reboot) [![Code Climate](https://codeclimate.com/github/rubysg/rubysg-reboot.svg)](https://codeclimate.com/github/rubysg/rubysg-reboot)

This is the app for [ruby.sg](http://ruby.sg), rebooted - a community site for the Singapore Ruby Community!

## Contributing to ruby.sg

ruby.sg needs your help and we would love to see contributions from anyone in the community.

Please refer to the [GitHub Issues](https://github.com/rubysg/rubysg-reboot/issues) for details on features/bugs/chores that you can help with.

You can also raise feature requests, or bug reports on GitHub Issues.

The initial design of ruby.sg was done by @winstonyw who is not a designer by training. :)

## Singapore Companies using Ruby

You can add your company to [ruby.sg](http://ruby.sg#companies) by editing [company.rb](app/models/company.rb).

Instructions as follows:

Update the constant `LIST` with your company details.

*Do not worry about the order as `LIST` will be sorted alphabetically.*

1. Name of Company
2. Website of Company
3. Logo URL (max height 100px)
 - Tip: Issue a Pull Request on GitHub, add your logo to the PR's description and use the GitHub link.
4. Address of Company
 - In the future, we might be able to map all companies onto a map!
5. Hiring URL
 - If you are hiring, add the link to the JD, otherwise, set as `nil`.
6. Email
 - A generic company email

Notes:

- Use single quotes
- Align hash values so that it's easier to scan

After you are done, please run specs with `rspec`. 

There are basic specs that validate the integrity of constant `LIST` 
and so if specs fail, please fix the errors before issuing a Pull Request.

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
You'll also be listed in this readme as a core contributor and get deployment rights in the future.

### Voluntary Contributors

Just start writing code (with tests if possible). Make a Pull Request when you are done.

Help with typos, design tweaks etc! The core contributors will review and merge in your PRs.

## Testing

All features/bug fixes should come with tests. We're using RSpec.

To run tests, just run `rake` or `rspec` on console.

## Deployment

The app is currently deployed on Heroku. No fuss. No thrills.

## Questions

Please feel free to email hello@ruby.sg.
