# AskMe

A social network app in which it is possible to register, ask questions to users and answer questions. Anonymous
questions are also available.

The user can customize his profile: change the background color, choose an avatar, change the password.
Security from spam and bots is provided by the recaptcha v.3
To simplify the work of users with the application, a hashtag service is used.

## Ruby and Ruby on Rails version

- Ruby 3.1.2

- Rails  6.1.3

## Deploy app

Note: all commands must be run from the command line/terminal, from the directory, where you clone repository

1. Download or clone repository, then run bundler

```ruby
bundle
```

2. To create a database, run

```ruby
rails db:schema:load
```

3. Recaptcha setup

Register reCAPTCHA v3 keys [here](https://g.co/recaptcha/v3).
Create `.env` file and add the received reCAPTCHA v3 keys to it (see `.env.example` for this)

4. Database in production environment

In `.env` file specify the data to connect to your database (see `.env.example` for this)

## How to run app

To start the Rails server, type

```ruby
rails s
```
