# AVENGERS APP

This a simple app that contains the following: 
* Users can register. 
* Users can create a post, 
* Users can comment on their own or another user’s posts.
* User can edit his/her user profile or delete the account. 
* Also, a guest may browse posts, view them and read comments, but if a guest tries to comment on a post, they will be prompted to login or register.
* Users can see all posts but only are able to edit or delete their own posts, not others.
* Users can delete their post only if there are no comments after it
* On the home page, there is a collection of posts displayed as blocks and each block contains information about the post: title, date, author & comment count. 
* Upon clicking on that block, the post with its description is shown on a new page
* Number of post blocks on the home page is limited to 2 posts per page and users need to click on the next page using standard pagination.
* Also, comments use pagination to showcase its use. 

This app is deployed on heroku, please follow the link:
http://amird-avengers.herokuapp.com/

To get this app up and running on your local machine you need to have POSTGRESQL installed and then run the following commands:

* `bundle install` - to install the dependencies, 
* `rails db:setup` - to create the database
* `rails db:migrate` - create the models,
* `rails db:seed` - seed the database
and you are ready to go. 

Notes:

* The seed file will insert some random data into the database. You may sign up with your own credentials or you could log in by using one of the five seeded login credentials:
email:	user-1@mail.com
	user-2@mail.com
	…
	user-5@mail.com
Pass: avengers

* As per instructions from the project requirement, the index page shows only 2 posts simultaneously and via pagination mechanism it is possible to browse through the rest

* User model is based on Devise gem and to it I added 2 more attributes: First name and last name

* Post model is used with scaffold generator

* Comment model is generated manually, as well as comments controller
