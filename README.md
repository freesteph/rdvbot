# Rdvbot

Rdbot is a Mattermost integration that responds to a natural meeting
request (unstructured human input) and tries to create the right event
in the sender's calendar.

## How it works

Rdvbot tries to help you organise events like this:

1. someone on Mattermost types "/rdv tomorrow morning with @batman";
2. rdvbot uses AI to understand and format the event as JSON;
3. a confirmation is presented to the user;
4. if confirmed, an email is sent with the appropriate ICS invite.

## TODO

- [X] confirmation dialog
- [ ] ical formatting
- [ ] email sending

## Getting started

You can boot the project with `docker compose up` and get yourself
inside a shell with `make sh`. Explore the [Makefile][./Makefile] for
helpful commands.

Then:

1. create a local Mattermost account at http://localhost:8065;
2. [create yourself a personal access
   token](https://developers.mattermost.com/integrate/reference/personal-access-token/)
   and put it in `RDVBOT_MATTERMOST_API_TOKEN`;
3. [create a slash command](https://developers.mattermost.com/integrate/slash-commands/) and point it to `http://rdvbot:9292/receive`;
4. also replace the `RDVBOT_OPENAI_KEY` in `.env` with an actual key;
5. reboot the project and start calling `/rdv`.

## About

This project is a personal attempt at building something with AI and
also the dry-rb gems which I have been exploring lately.
