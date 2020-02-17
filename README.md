# Associations
Microverse Ruby on Rails Project No.7 [Associations]

In this project, you will build an application named Private Events and that behaves similar to Eventbrite. The main goal is to put in practice the main concepts of Associations in rails.: [Full task description](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations.)


# Setup
You can setup this project by;
#### Either Cloning it
git@github.com:rkyankya/Private-Events.git
#### Or downloading the Zipped file from
https://github.com/rkyankya/Private-Events.git

## Before you start


- Remember to run `bundle install` in your terminal. In case of an error run `bundle update`.
- Run `rails db:drop` to reset the schema.
- Afterwards, run `rails db:create` and `rails db:migrate` on your terminal.
- Finally run `rails db:seed` to generate data for the tables.
- Run `rails server` to start the sever `localhost:3000`
- We have a cool gem! To use it, run the rails console typing "rails c" in your terminal and when it loads type in the first line "Hirb.enable", it will return true if everything is working. Now you can see the tables of the database!

# Project specifics

Once you enter the page, it is going to ask you to log in as the user using the username (for your convenience, usernames go from foo1 to foo5, so feel free to write any). After you enter the name is going to redirect you to the user's page which has four cathegories:

- Upcoming events: Events I am going to.
- Past events: Events I went.
- My events: Events I have created.
- My invitations*: Events I am invited, but I haven't confirmed my assistance yet.

> In the Odin project specifications, we have an option which is to invite users to events, and only those invited can go to the event. This is why there is a column 'Invitations' in the user's page.

## Event's page:

In here we have three options:

- I am not invited: It will display the events specifications and the list of attendees to the event, but I will not have the opportunity to assist.
- I am invited: It will show the same as if I weren't invited, but I will have the opportunity to attend (or to 'Change my mind' and not go).
- I am the creator: It will display the same, but I will have the power to invite (or uninvite) people to my event: It will display the name of all users with a checkbox, either marked or unmarked, it depends if the user is already invited or not. If it is, it will be checked. If it's not, it won't. To uninvite a user you can only uncheck the checkbox, to invite, you only need to check the checkbox.

# Built with

- Ruby ~> 2.6.5
- Rails ~> 6.0.2
- VSCode

# Authors

- Kyankya Raymond: [Github](https://github.com/rkyankya)
- Lucas Mazo: [Github](https://github.com/lucasmazo32)