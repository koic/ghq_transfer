# ghq_transfer

Transfer local repositories from flatten directory style to [ghq](https://github.com/motemen/ghq) convention style.

## Usage:

```sh
% ghq_transfer [--dry-run] [--valth]
```

Options:

* `--dry-run` ... Dry run mode (First of all, You'll run this)
* `--valth`` ... Apply mode

## 1. Execute dry run mode

Example effect:

For example, your `ghq root` is `~/.ghq`.

Following the __dry run mode__.

```sh
% ghq_transfer --dry-run
/Users/account/.ghq/rabbit -> /Users/account/.ghq/github.com/rabbit-shocker/rabbit
/Users/account/.ghq/racc -> /Users/account/.ghq/github.com/tenderlove/racc
/Users/account/.ghq/rack -> /Users/account/.ghq/github.com/rack/rack
/Users/account/.ghq/rack-attack -> /Users/account/.ghq/github.com/kickstarter/rack-attack
/Users/account/.ghq/rack-cache -> /Users/account/.ghq/github.com/rtomayko/rack-cache
/Users/account/.ghq/rack-mini-profiler -> /Users/account/.ghq/github.com/MiniProfiler/rack-mini-profiler
/Users/account/.ghq/rack-pjax -> /Users/account/.ghq/github.com/eval/rack-pjax
/Users/account/.ghq/rack-protection -> /Users/account/.ghq/github.com/rkh/rack-protection
/Users/account/.ghq/rack-test -> /Users/account/.ghq/github.com/brynary/rack-test
/Users/account/.ghq/rails -> /Users/account/.ghq/github.com/rails/rails
```

These ghq convention layout decisions based on `git config --get remote.origin.url` of each repositories.

## 2. Execute apply mode

Apply the ghq convention layout to your `ghq root` repositories.

```sh
% ghq_transfer --valth
```

:star2: __Execute apply mode after dry run mode, strongly recommended.__

## Requirements

* [ghq](https://github.com/motemen/ghq)

## Install

Add these lines to your application's Gemfile:

```sh
gem 'ghq_transfer'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install ghq_transfer
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

ghq_transfer is released under the [MIT License](http://www.opensource.org/licenses/MIT).
