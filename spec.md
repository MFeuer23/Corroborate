# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (ApplicationController inherits from Sinatra::Base)
- [x] Use ActiveRecord for storing information in a database (models inherit from ActiveRecord::Base)
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) (models are user, claim, and subject)
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts) (user has many claims/ claims belong to user, subject has many claims/claims belong to subject)
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
- [x] Include user accounts
- [x] Ensure that users can't modify content created by other users
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Include user input validations (used bcript gem to authenticate passwords)
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) (used flash messages)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
