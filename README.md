# Hashiru means "to run" in Japanese

This a running hub for all topics related to running, developed by John Lee.

Hosted at https://hashiru.herokuapp.com/

Two Controllers and Two Models
- Activity and Address Model: Activity has an Address that is polymorphic.  The address related to activity will have addressable_id=activity_id and the addressable_type=Activity.
- ActivitiesController: has index, create, and destroy functions.  The index function responds to json and xml requests but requires the user to be signed in. (Eg. https://hashiru.herokuapp.com/activities.xml)
- AddressesController: Contains show method that does not require user to be signed in. Just request an address by id. (Eg. https://hashiru.herokuapp.com/addresses/1)

Unit, Functional, and Integration Tests
- There are 215 test cases. They can be executed by running "rspec spec/".  Continuous integration can be enabled by running "guard" which has been configured with Spork. 

AJAX operation
- There are two AJAX operations.  They are the follow and unfollow buttons and are AJAX because the following attribute is set, 'remote:true'.

REST API
- Both ActivitiesController.index and AddressesController.show are REST APIs.  Both APIs will repsond to XML and JSON requests. (Eg. https://hashiru.herokuapp.com/activities.xml or https://hashiru.herokuapp.com/addresses/1.xml)

RSS Feeds
- I also tried the 'feedzirra' gem to processes RSS feeds. The feeds are displayed in the 'Recent Running Articles' section as links. 