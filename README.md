# Faraday Middleware Template

This repo is a template for building [Faraday][faraday] middleware.
Faraday is an HTTP client library that provides a common interface for making requests.
This interface allows classes to be loaded into the request/response lifecycle to provide
common functionality such as authentication, parsing, encoding, and much more.
These classes are called middleware. Use this repository to create your own middleware gem.

## Getting Started

### Preparing

This is a [`gem_generator`][gem_generator] template, so firstly you have to install it:

```sh
gem install gem_generator
```

### Usage

The next step is for you to generate a new Faraday middleware via `gem_generator` call.

First of all, you should decide on the name of your middleware.
The current convention (which is by no means mandatory) is to call middleware gems as `faraday-<something>`.
Here are some examples:

* `Hashie::Mash::Rash`: [`faraday-rashify`][faraday-rashify]
* XML (request): [`faraday-encode_xml`][faraday-encode_xml]

Then, you should call the generation command, like this:

```sh
gem_generator faraday-my_middleware lostisland/faraday-middleware-template --git
```

More usage info and options you can get by `gem_generator --help` or in the [`gem_generator`][gem_generator] README.

There are placeholders in this repository with template for your chosen middleware name.
So once you decide on the final name you want to use and ran the generation command — you will see all occurrences
of `MyMiddleware` and `my_middleware` in all files with and their names with the name you chose.

Also please notice: your name and email will be mentioned in `*.gemspec` file and `LICENSE.md`.
By default, they're taken from `git config`, but you can also specify them in a `gem_generator` config file
(in the home directory, for example).

### Basic implementation

The bulk of the implementation is in the `Faraday::MyMiddleware::Middleware` class.
We've added lots of comments in there to guide you through it, but if you have any doubt/question
please don't hesitate to get in touch!

[faraday]: https://github.com/lostisland/faraday
[gem_generator]: https://github.com/AlexWayfer/gem_generator
[faraday-rashify]: https://github.com/lostisland/faraday-rashify
[faraday-encode_xml]: https://github.com/AlexWayfer/faraday-encode_xml
