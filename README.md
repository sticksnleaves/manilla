# Manilla

[![Build Status](https://travis-ci.org/sticksnleaves/manilla.svg?branch=master)](https://travis-ci.org/sticksnleaves/manilla)

Text folding for the Rubyist

Go from this:

```
Hello, world!
```

to this:

```ruby
Manilla.fold('Hello, world!', 8, "\r\n\s", :word)
# => Hello,
#     world!
```

and back again:

```ruby
Manilla.unfold("Hello,\r\n world!", "\r\n\s")
# => Hello, world!
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'manilla'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install manilla

## Usage

Manilla provides two methods for folding text: **character** and **word**

### Character Folding

Folding on character will instruct Manilla to insert a fold at a specific width.
It will not pay attention to word boundaries or any other delimiter. Character
folding is the default folding method.

```ruby
Manilla.fold('Hello, world!', 8, "\r\n\s")
# => Hello, w
#     orld!
```

### Word Folding

Word folding will cause Manilla to break text at word boundaries.

```ruby
Manilla.fold('Hello, world!', 8, "\r\n\s", :word)
# => Hello,
#     world!
```

If a word is longer than the specified max width it will be folded at max width.

```ruby
Manilla.fold('Hello, world!', 2, "\r\n\s", :word)
# => He
#     ll
#     o,
#
#     wo
#     rl
#     d!
```

### Unfolding

Unfolding is the process of reversing a fold. It will treat delimiters as blank
strings.

```ruby
folded_text = Manilla.fold('Hello, world!', 8, "\r\n\s", :word)

Manilla.unfold(folded_text, "\r\n\s")
# => Hello, world!
```

## API

### ```Manilla.fold(text, maxwidth, delimiter, break_on)```

Fold text using the specified delimiter at a maximum width. Folding can occur on
```:char``` or ```:word```.

### ```Manilla.unfold(text, delimiter)```

Unfold text using a specified delimiter.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/manilla/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
