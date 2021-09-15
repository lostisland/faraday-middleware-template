# Faraday Middleware Template

This repo is a template for building [Faraday][faraday] middleware.
Faraday is an HTTP client library that provides a common interface for making requests.
This interface allows classes to be loaded into the request/response lifecycle to provide
common functionality such as authentication, parsing, encoding, and much more.
These classes are called middleware. Use this repository to create your own middleware gem.

## Getting Started

### Setting up and cloning the repo

You can start using GitHub's [Use this template][use-template] button.
![Use this template](https://docs.github.com/assets/images/help/repository/use-this-template-button.png)

This will create a repository based off from this template.
After that is created, you can clone it locally to start working on it.

### Refactoring the template

The next step is for you to find and replace all the "parametrised" names in this template
and change them to make it unique.

First of all, you should decide on the name of your middleware.
The current convention (which is by no means mandatory) is to call middleware gems as `faraday-<something>`.
Here are some examples:

* `Hashie::Mash::Rash`: [`faraday-rashify`][faraday-rashify]

In this template repository, the placeholder for your chosen adapter name is `MyMiddleware` (`my_middleware`).
So once you decide on the final name you want to use you should update all occurrences of `MyMiddleware` and all files
with `my_middleware` in their name with the new name you chose.

Also don't forget to mention yourself as author in `*.gemspec` file and `LICENSE.md`.

### Main implementation

The bulk of the implementation is in the `Faraday::Middleware::MyMiddleware` class.
We've added lots of comments in there to guide you through it, but if you have any doubt/question
please don't hesitate to get in touch!

[faraday]: https://github.com/lostisland/faraday
[faraday-rashify]: https://github.com/lostisland/faraday-rashify
[use-template]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
