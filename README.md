# Fetch Points Assignment README

This application is using Ruby on Rails v6.1.4.1

## Setup
* Clone repositiory
* run `bundle exec install`
* Create db - run `rails db:create` 
* Create migrations - run `rails db:migrate`
* Run server `rails s`

## API Calls
* Open API platform (ex. Postman)
* POST all transaction at `http://localhost:3000/transactions` one at a time. ex.

```javascript 
 {"transactions" :
  {
    "payer": "DANNON",
    "points": 1000,
    "timestamp": "2020-11-02T14:00:00Z"
  }
}
```

* To spend desired points, go to `http://localhost:3000/transactions/spend` and POST. ex. 
```javascript 
{
    "points" : 5000
}
```
* To check on points GET at `http://localhost:3000/transactions`

This project was completed by Anug Saha. Please reach out if you have any questions. Thank you!
