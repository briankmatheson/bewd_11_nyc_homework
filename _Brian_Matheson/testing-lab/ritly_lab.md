![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Exercise_icon_md.png)

Time to continue. You have tests for login with user. Now you need to add some more!


#Ritly
####Time: 60 min

Here is a brief overview of the app.

*  Logged in users to Ritly will be able to request a randomly generated code for their URL link and save it to the database.
* Visitors to Ritly can go to ```localhost:3000/<CODE>```, where ```<CODE>``` is a randomly generated code, and the application will redirect them to the  matched link in the database.
* Visitors to Ritly can go to ```localhost:3000/<CODE>/preview```, and the app will preview the matching URL link from the database.



###Task Instructions

* Refactor the creation of a URL object from the controller into the model. 
* Add unit tests for the URL object. 
* Test that the object has validations. 
* Write a feature test which tests the flow of creating a new link. 

### Bonus
* Add more feature tests: 
    * Test for previewing a link
    * Test for redirecting to an actual link (You'll need google/docs for this one!)
* Add better test coverage to your model tests. 
  