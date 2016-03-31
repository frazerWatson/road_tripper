# RoadTripper

## Repo Badges

[![Coverage Status](https://coveralls.io/repos/github/frazerWatson/road_tripper/badge.svg?branch=master)](https://coveralls.io/github/frazerWatson/road_tripper?branch=master)

[![Build Status](https://travis-ci.org/frazerWatson/road_tripper.svg?branch=master)](https://travis-ci.org/frazerWatson/road_tripper)

## Description

A responsive web application to help you plan a road trip and share your journey with other users.

## Team Members
- [Godfrey Chiu](https://github.com/ggwc82)
- [Barry Grubb](https://github.com/barrygrubb)
- [Frazer Watson](https://github.com/frazerWatson)

## Stack

- Ruby on Rails 4
- Postgresql
- Bootstrap
- Hosted on Heroku

## Additional Technologies

- Amazon Web Services
- Google Maps API
- Geocoder

## Installation Instructions
- Clone the repository
- bundle install
- rake db:create
- rake db:migrate
- rails s
- Go to 'http://localhost:3000' in your browser to run the app.

## Testing Instructions

### RSpec (Rails - unit and feature tests)
- rspec
- coveralls report

## Implementation

Roadtripper was built using Ruby on Rails with Postgresql. RSpec and Capybara is the main testing framework. We used 'Gmaps4rails' gem to wrap Google Maps Javascript API into our Ruby codebase. Test coverage is provided by Coveralls and TravisCI.

## Completed User Stories

### MVP

```
As a user,
so that I can share my journey with others,
I want to be able to create a road trip.
```
```
As a user,
so that I can have a profile,
I'd like to be able to sign up as a user.
```
```
As a user,
so that I can see other people's road trips,
I'd like to be able to see all created road trips.
```
```
As a user,
so that I can plan my trip,
I'd like to have a dashboard.
```
```
As a user,
so that I can share my road trip experience,
I'd like to be able to make posts on my road trip.
```
```
As a user,
so that I get feedback from other users,
I'd like all users to be able to leave comments on my posts.
```
```
As a user,
so that I can plan my route,
I'd like to be able to create stops and view the route on Google Maps.
```