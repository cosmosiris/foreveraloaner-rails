### Forever A Loaner 
This app is a service for people who want to borrow things from other people. It was initially supposed to be a Rails-React app, but we only had 7 days to build the app which was not enough time to learn React. On the 3rd day we decided to switch gears and start over will a full rails app. 

Because of the loss of 3 days, we were not able to add all of the features that we wanted such as a payment system for reserving an item. But we are happy with the end product--a fully functioning rails app accompanied by a full test-suite. 

### Forking This Repo
Everything is setup for you. All you need to do is:

1. `bundle install`
2. `rails db:create`
3. `rails db:migrate`
4. `rails db:seed`
5. `rails s`

### Current Features
1. Users can create an account and post an item they want to loan
2. Users can search for items by keyword. Our zipcode API key is no longer working so searching by zip-code is currently not working. 
3. Users can visit the profile of a loaner or borrower they are interested in working with
4. Users can review a person they have borrowed from
5. Users can review a person they have loaned an item to
6. In-app private messaging
7. Full test-suite 

### Stretch Goals
1. Booking/Payment system for making a security deposit when reserving an item  

### Contributors
* Iris Nevins => @cosmosiris
* Olivia Morgan => @livy1159
* Shannon Nolan => @shannonnolan17
* Brittney Flowers => @beatnikflow
* Caroline Yoon => @carolyoon

### Technologies 
1. Ruby on Rails & Ruby
2. ZipCodeApi (for finding zip codes within a certain radius)
3. Paperclip Gem (for uploading images)
4. Devise (for user authentication/registration)
5. Mailboxer Gem (for in-app messaging)
6. HTML
7. JQuery & Javascript
8. CSS
9. Bootstrap

### Screenshots
### Landing Page 
![Landing Page](https://raw.githubusercontent.com/cosmosiris/foreveraloaner-rails/development/public/github-images/landing-page.png)
### User Profile
![User Profile](https://raw.githubusercontent.com/cosmosiris/foreveraloaner-rails/development/public/github-images/profile-page.png)
### A Post
![Post](https://raw.githubusercontent.com/cosmosiris/foreveraloaner-rails/development/public/github-images/post-show.png)
### Search Results
![Search Results](https://raw.githubusercontent.com/cosmosiris/foreveraloaner-rails/development/public/github-images/search-results.png)
### Messaging
![Messaging](https://raw.githubusercontent.com/cosmosiris/foreveraloaner-rails/development/public/github-images/chat-box.png)
![Messaging](https://raw.githubusercontent.com/cosmosiris/foreveraloaner-rails/development/public/github-images/chat-feature.png)


### Demo
https://foreveraloaner.herokuapp.com/ 

