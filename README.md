# Week 5 Assessment - Contact List

For our assessment, we are going to be working with an app that stores contacts
for users.

## Setup

1. Fork and clone this repository
1. `bundle install`
1. Create a new Pivotal Tracker project by importing `stories.csv`. Add the
project under the gSchool account and add all instructors as project owners.
1. Complete and deliver each story in Tracker.

## Notes

1. Unlike your exercise last week, you will not have to register users. The users
are already created and you can log them using the username/password combinations
in `app.rb`.
1. Contact information is stored in `@contact_database` (see `app.rb`). Contacts
have already been stored in the database for you. Contacts are inserted with a
user_id, which is the id of the user that the contact belongs to.

## Expectations

**Acceptance Tests**: you should have an acceptance test in Capybara that covers
all the functionality in the stories.

**Pivotal Tracker**: Tracker stories should be delivered for all the stories that
you get through.
