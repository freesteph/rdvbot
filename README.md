# Rdvbot

Rdbot is a Mattermost integration that responds to a natural meeting
request (unstructured human input) and tries to create the right event
in the sender's calendar.

## How it works

Rdvbot tries to help you organise events like this:

1. someone on Mattermost types "/rdv tomorrow morning with @batman" ;
2. rdvbot uses AI to understand and format the event as JSON ;
3. a confirmation is presented to the user;
4. if confirmed, an email is sent with the appropriate ICS invite.

## TODO

- [X] confirmation dialog
- [ ] ical formatting
- [ ] email sending

## About

This project is a personal attempt at building something with AI and
also the dry-rb gems which I have been exploring lately.
