# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - controller inherits from Sinatra
- [x] Use ActiveRecord for storing information in a database - models inherit from ActiveRecord. used db migrations to create database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) models are claim, subject, and user
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts) user has many claims, and subject has many claims
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User) claims belong to a user, and also belong to a subject
- [x] Include user accounts- user has_secure_password and the password must be authenticated when logging in
- [ ] Ensure that users can't modify content created by other users
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Include user input validations- user can't make an new claim if any fields are blank, or if user doesn't agree to terms
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) used rack-flash to show warning if user failed to fill out any fields when creating a new claim
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
