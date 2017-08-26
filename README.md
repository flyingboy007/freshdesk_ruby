# FreshdeskRuby [![Build Status](https://travis-ci.org/flyingboy007/freshdesk_ruby.svg?branch=master)](https://travis-ci.org/flyingboy007/freshdesk_ruby)

A ruby gem for using the Freshdesk REST API(No dependencies!!!!)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freshdesk_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freshdesk_ruby
In an Initialiser add:

```ruby
Freshdesk.configure do |config|
production
  config.url =  "Put your Freshdesk base_url here"
  config.api_key =  "Put your Freshdesk api_key here"  
end
```    

## Usage

### Tickets
**Create a Ticket**
 

    ticket_params= {
            "description": "Details about the issue...",
            "subject": "Support Needed...",
            "email": "test@test.com",
            "priority": 1,
            "status": 2
        }
    response=Freshdesk::Ticket.create_a_ticket(ticket_params)

**View Tickets**

       #in query put the search criteria(no need to url encode)
       query= "email=test@test.com"
       response=Freshdesk::Ticket.view_all(query)
     

As of now getting tickets based on some criteria and creating new tickets are the features I needed in my app.  I will try to put some more features in the future. If you are interested in contributing please submit a pull request(please provide tests aswell). Have a great day..
         
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/flyingboy007/freshdesk_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
