# Animation Prompter

This is just a simple Ruby gem implementing the functionality of [Animation Prompter](https://dreamingtulpa.com/tools/animation-prompter) on my website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tulpa-prompter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install prompter

## Usage

```
json_string = Prompter.call(
  lines: ["prompt #1", "prompt #2", "prompt #3"],
  prefix: "portrait of ",
  suffix: " by greg rutkowski",
  interval: 15,
  shuffle: false
)
```

Or you can use it as a CLI:

```
bin/prompter path/to/prompts.txt --prefix "portrait of " --suffix " by greg rutkowski" --interval 15 --shuffle
```

This copies the output to the clipboard on macOS. Doesn't work for other platforms yet. If you want it, submit a PR.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
