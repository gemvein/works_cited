# Works Cited

Works Cited allows you to add a list of the works cited in ActiveRecord objects, to be formatted by a helper that can be added to relevant pages to format the citations like a bibliography.

MLA formatting will be added first, but other formats are planned for the future.

Works Cited is in the very earliest stages of development. It doesn't actually work yet.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'works_cited'
```

And then execute:
```bash
$ bundle install
```

Then generate the migrations
```bash
$ rails g works_cited:install
```

## Usage
Make a model ready to accept citations

```ruby
has_works_cited
```

Add the helpers to the relevant views

```haml
= works_cited @record
```

##Contributing

-   Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
-   Check out the issue tracker to make sure someone already hasn't
    requested it and/or contributed it.
-   Fork the project.
-   Start a feature/bugfix branch.
-   Commit and push until you are happy with your contribution.
-   Make sure to add tests for it. This is important so I don't break it
    in a future version unintentionally.
-   Please try not to mess with the Rakefile, version, or history. If
    you want to have your own version, or is otherwise necessary, that
    is fine, but please isolate to its own commit so I can cherry-pick
    around it.

## Copyright

Copyright (c) 2021 Loren Lundgren. See LICENSE.txt for further details.
