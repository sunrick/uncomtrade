# Uncomtrade

Simple gem for using the [UN Comtrade API][comtrade]. Their docs state the API can be changed at any moment, so use caution using this gem. I will try to keep it up-to-date as possible.

Basic objectives of gem:
* Keep parameter names and default values consistent with API.
* Convenience methods to make querying and processing data easier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uncomtrade'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uncomtrade

## Basic Usage

```ruby
  request = Uncomtrade::Request.new(max: 2)
  response = request.get_data

  response.dataset
  #=> [{"pfCode"=>"H4","yr"=>2014, ...}, ... ]

  response.cherry_pick(:period, "TradeValue")
  #=> [{"period"=>2014, "TradeValue"=>5229972238}, ...]
```

## Detailed Usage

### Request object

CAUTION: Currently the API only supports the `type` parameter to equal `C`. In this gem you cannot change the `pmt` parameter from `json`.

#### Creating the object

In order to make a request to the API you'll need to create a request object. For convenience, all query parameters have defaults based on the [UN Comtrade API docs][comtrade]. View the current parameters for your request by calling `.params`.

```ruby
  request = Uncomtrade::Request.new
  request.params
  #=>  {:max=>500, :fmt=>"json", :r=>"all", :freq=>"A", :ps=>"now",
  #     :px=>"HS", :p=>0, :rg=>"all", :cc=>"TOTAL", :type=>"C"}
```

When you create a request object you can specify what parameters you want to set values for, ones that are not set will retain their default value.

```ruby
  request = Uncomtrade::Request.new(max: 200, freq: "M", p: "nl" )
  request.params
  #=> {:max=>200, :freq=>"M", :fmt=>"json", :r=>"all", :ps=>"now",
  #    :px=>"HS", :p=>258, # see country finder helper
  #    :rg=>"all", :cc=>"TOTAL", :type=>"C"}
```

#### Updating and resetting the request object

You can update a single parameter or multiple parameters after you've created the request object. You can also reset all of the parameters to their default values by calling `.reset`.

```ruby
  request = Uncomtrade::Request.new
  request.update(max: 200)
  request.update(max: 300, freq: "M")
  request.reset
```

#### Country finder helper

The [UN Comtrade API][comtrade] uses ISO numbers for identifying countries/regions. This gem uses the [countries gem][countries] to help you use two/three letter country codes, as well as country names to find the number for you. For a list of available countries/regions check the [UN Comtrade API][comtrade] docs. You can also just use the ISO number.

```ruby
  # Netherlands
  request = Uncomtrade::Request.new
  request.update(p: "NLD")
  request.update(r: "NL")
  request.update(p: "netherlands")
  request.update(p: 528)
```

If you're not specific enough or you write a bad country code, you will get the following exception.

```ruby
  request = Uncomtrade::Request.new(p: "u")
  #=> Uncomtrade::CountryError: Could not find specified country/code: u

  request = Uncomtrade::Request.new(p: "united")
  #=> Uncomtrade::CountryError: Could not find specified country/code: united
```

### Response object

#### Data methods

Calling `.result` will hand back the entire JSON response.
Calling `.dataset` will hand back the value of the dataset key from the JSON response. (array of results)

```ruby

  request = Uncomtrade::Request.new(max: 2)
  response = request.get_data

  response.result
  response.dataset
  
```

#### Convenience methods

To iterate over the dataset to only get the information you want, call `.cherry_pick`. The method allows you to rename keys if you want. See below.

```ruby

  request = Uncomtrade::Request.new(max: 2)
  response = request.get_data
  
  response.cherry_pick(:period => "Year", :TradeValue => "Value")
  #=> [{"Year"=>2014, "Value"=>5229972238}, ...]

  response.cherry_pick(period: :year, TradeValue: :trade_amount)
  #=> [{:year=>2014, :trade_amount=>5229972238}, ...]

  response.cherry_pick("period" => "period", "TradeValue" => "TradeValue")
  #=> [{"period"=>2014, "TradeValue"=>5229972238}, ...]

```

Use `.to_csv` to save a csv file with data that you want. If you don't specify any selectors all data will be returned.

```ruby

  request = Uncomtrade::Request.new(max: 2)
  response = request.get_data
  
  selectors = { period: :period, 
                TradeValue: :trade_amount, 
                rtTitle: :reporter_country }

  # ONLY DATA FROM SELECTORS
  response.to_csv(file: "filepath.csv", selectors: selectors)

  # ALL DATA
  response.to_csv(file: "filepath.csv")

```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sunrick/uncomtrade. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


[comtrade]: http://comtrade.un.org/data/doc/api/
[countries]: https://github.com/hexorx/countries