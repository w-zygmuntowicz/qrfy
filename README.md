# Qrfy

A really simple wrapper around https://qrfy.com/ API. Documentation of the API is here https://qrfy.com/docs/QR. To use that API you have to setup your API key first.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add qrfy

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install qrfy

## Usage

First setup the API key in the rails initializers

```ruby
# config/initializers/qrfy.rb
Qrfy.configure do |config|
    config.api_key = ENV["QRFY_API_KEY"]
end
```

You could setup the API key during the client initialization as well (if you set it up in the initializer, then it'll be used by default):
```ruby
client = Qrfy::Client.new(api_key: ENV["QRFY_API_KEY"])
```

## Resources

### QR


#### Create
Create a new QR code:
```ruby
id = client.qrs.create(qr_params)
```

Create many QR codes at once:
```ruby
ids = client.qrs.create([qr_params1, qr_params2])
```

You can also attach global style for your qr images and folder in which it should be saved.
```ruby
id = client.qrs.create(qr_params, style: { shape: { style: :sparkle } }, folder_id: 1)
```


### Folder

You can list folders by following that code:
```ruby
client.folders.list.each do |folder|
    puts "Folder ##{folder.id} with name: #{folder.name} was created at: #{folder.created_at} and has #{folder.qrs} images attached."
end
```

And create new folders using:
```ruby
folder_id = client.folders.create({ name: "My first folder" })
```

## Error handling

This gem follows the exception error handling. All errors raised by this gem inherits from `Qrfy::Errors::Base` class and belong to the following categories:
    
    * `Qrfy::Errors::RecordInvalid`
    * `Qrfy::Errors::Unauthorized`
    * `Qrfy::Errors::RecordNotFound`
    * `Qrfy::Errors::TooManyRequests`
    * `Qrfy::Errors::InternalServerError`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/w-zygmuntowicz/qrfy.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
