## Unfortunately, the package is no longer being maintained.
---

# Platon [![Ruby Gem](https://github.com/mikhail-krainik/platon/actions/workflows/gem-push.yml/badge.svg)](https://github.com/mikhail-krainik/platon/actions/workflows/gem-push.yml)
Gateway for Platon processing center
(https://platon.ua/)

## Installation

```ruby
gem 'platon'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install platon
```

## Usage as engine

##### /config/routes.rb

```ruby
Rails.application.routes.draw do
  mount Platon::Engine => "/platon"
end
```
##### /config/initializer/platon.rb

Methods which called when something happen.
```ruby
Platon::Callbacks.setup.success =->(_result) { puts 'success' }

Platon::Callbacks.setup.failed =->(_result) { puts 'failed' }

Platon::Callbacks.setup.error =->(_result) { puts 'error' }
```

## Usage as service

#### create form
```
# product description (important keys)
data = {amount: '99.99', currency: 'USD', description: 'Show desciption less that 255 byte'} 

# product order id (important key)
order = 1892

# addition field in form :name, :value
ext = [{name: 'discont', value: 10}]

@service = Platon::FormService.call(data, order: order, extra_fields: ext)

# views/pay/index.html.erb
<form action="<%= @service.form_prop[:url] %>" method="<%= @service.form_prop[:method] %>">
  <% @service.fields.map do |field| %>
    <input type="<%= field[:type] %>" name="<%= field[:name] %>" value="<%= field[:value] %>">
  <% end %>
  <input type="submit" value="Pay">
</form>
```

#### parse response

```
# /app/controllers/callback_controller.rb

def create
    service = Platon::CallbackService.call(params)
    
    if service.success?
        head :ok
    else
        head :bad_request
    end
end    
```

## General options

```
gem 'dotenv-rails'

# config/application.rb
Bundler.require(*Rails.groups)

Dotenv::Railtie.load
```

##### /.env

```ruby
PLATON_KEY=XXXXXXXXXX
PLATON_PASSWORD=XXXXXXXXXX
PLATON_URL=https://secure.platononline.com/payment/auth
PLATON_CALLBACK_URL=http://localhost/platon
PLATON_PAYMENT_METHOD=CC
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
