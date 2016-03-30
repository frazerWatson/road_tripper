# RoadTripper

## Repo Badges

[![Coverage Status](https://coveralls.io/repos/github/frazerWatson/road_tripper/badge.svg?branch=master)](https://coveralls.io/github/frazerWatson/road_tripper?branch=master)

[![Build Status](https://travis-ci.org/frazerWatson/road_tripper.svg?branch=master)](https://travis-ci.org/frazerWatson/road_tripper)

## Description

An app to help you plan a road trip and share your journey with other users.

## Team Members
- Godfrey Chiu
- Barry Grubb
- Frazer Watson

## Stack

- Postgresql
- Ruby on Rails
- Heroku

## Installation Instructions
- Clone the repo
- bundle install
- rake db:create
- rake db:migrate
- rails s
- Go to 'http://localhost:3000' in your browser to run the app.

## Testing Instructions

### RSpec (Rails - unit and feature tests)
- rails g rspec:install (optional)
- rspec

## Implementation

Ruby on Rails with Postgresql and full CRUD functionality. RSpec testing framework. Uses 'geocoder' gem to wrap Google Maps javascript API. Coveralls and Travis CI.

## Completed User Stories

### MVP

```
As a user,
So that I can share a road trip,
I want to be able to create a road trip.
```
```
As a user,
So that I can have a profile,
I'd like to be able to sign up as a user.
```
```
As a user,
So that I can see other people's trips,
I'd like all trips to be public.
```
```
As a user,
So that I can plan my trip,
I'd like to have a dashboard.
```
```
As a user,
So that I can share my road trip with other people,
I'd like to be able to make posts on my trip log.
```
```

















