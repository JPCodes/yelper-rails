# Twilio Yelper

This app has two purposes: The one you can see and the one you can't.

The one you can see:
Go to the home page and search for a business.
Select one, then book a ride there with Uber. This works best on your phone.

The one you can't:
This app will send you text messages with restaurant recommendations.
The format is: "term, location" or "term, location, price point" (price point is $ signs up to 4)
Unfortunately, it only works for verified numbers so far.

### Set Up

Visit [twilio-yelper.herokuapp.com](twilio-yelper.herokuapp.com) to see a deployed version.

Or

1. Clone Repo.
2. ```bundle install```
3. Rake db:set-up
4. Find all ENV keys and replace with your own.
5. ```rails s```

### Tech

Ruby on Rails
Twilio, Yelp, Uber APIs
Sidekiq
Bootstrap & SASS
jQuery

### Known Bugs

Seems to fail for Uber rides to places far away from Portland, or perhaps just your location.

### Contact

* [Jonathan](https://github.com/JonathanWThom)

* [James](https://github.com/JPCodes)

### License

MIT
