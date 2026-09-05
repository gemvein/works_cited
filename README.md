# Works Cited

[![CI](https://github.com/gemvein/works_cited/actions/workflows/ci.yml/badge.svg)](https://github.com/gemvein/works_cited/actions/workflows/ci.yml)
[![Gem Version](https://img.shields.io/gem/v/works_cited)](https://rubygems.org/gems/works_cited)
[![Coverage](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/gemvein/works_cited/HEAD/badges/coverage.json)](https://github.com/gemvein/works_cited/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](http://opensource.org/licenses/MIT)

Works Cited allows you to add a list of the works cited in ActiveRecord objects, to be formatted by a helper that can be added to relevant pages to format the citations like a bibliography.

Works Cited uses CanCanCan to authorize the editing of citations. This makes it easy for you to control access.

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
$ rake works_cited:install:migrations
$ rake db:migrate
```

## Configuration

You will need to add access for the people who should be authorized. Works Cited uses CanCanCan for authorization. Simply add the appropriate permissions to your ability.rb file:

```ruby
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :list, WorksCited::Citation
    can :list, WorksCited::Contributor

    return if user.new_record? # Anonymous Users leave

    can :read, WorksCited::Citation
    can :read, WorksCited::Contributor
    # # We could have other rules in here, like:
    # can :manage, WorksCited::Citation, record: { user_id: user.id }
    # can :manage, WorksCited::Contributor, record: { user_id: user.id }

    return unless user.admin? # Non Admin Users leave

    can :select, :all
    can :manage, WorksCited::Citation
    can :manage, WorksCited::Contributor
  end
end
```

These four abilities gate different things, and `:list`/`:read` are **not**
redundant with each other despite sounding similar - each guards a
different feature:

- `:list` gates `works_cited_list`, the helper you call from your own
  views to embed a record's public bibliography (e.g. on a Page or
  Post). Grant this to whoever should be able to *see* citations exist -
  typically everyone, including anonymous visitors, since a bibliography
  is usually public-facing content.
- `:read` gates the standalone citation-editing UI this engine mounts
  (viewing/showing a citation there). Grant this to whoever should be
  able to *open* that UI - a narrower group than `:list`, e.g. only
  signed-in users.
- `:select` gates which of your own models show up in the "Select a
  Record" dropdown when creating a new citation - i.e. which records
  are citable targets at all.
- `:manage` (CanCanCan's built-in alias for full CRUD) gates
  creating/editing/destroying citations and contributors.

**If you only grant `:read` and citations mysteriously don't render**
via `works_cited_list`, this is why - `:list` needs granting
separately, it isn't implied by `:read`.

You may wish to add custom contributor roles or citation types. To do that, add something like the following to `config/initializers/works_cited.rb`:

```ruby
WorksCited.configure do |config|
  # This will dynamically generate a scope (.astrologians) and a boolean check (#astrologian?)
  # on WorksCited::Contributor
  config.valid_contributor_roles << 'astrologian'

  # This will dynamically generate a scope (.star_charts) and a boolean check (#star_chart?)
  # on WorksCited::Citation
  #
  # If you want to override the default view for any new (or existing) types:
  # List a citation: app/views/works_cited/citation_types/citation/_star_chart.html.[haml/erb]
  # Add/Edit a citation: app/views/works_cited/citation_types/fields/_star_chart.html.[haml/erb]
  config.valid_citation_types << 'star_chart'
end
```

## Usage
Make a model ready to accept citations

```ruby
has_works_cited
```

Add the helpers to the relevant views

```haml
= works_cited_list @record
```

To add routes so that you can edit citations on their own pages:

```ruby
  mount WorksCited::Engine => '/works_cited'
```

To add the fields, nested inside your forms

```haml
= form_for(@doodad) do |f|
  = works_cited_citations_fields f
```

Don't forget to add the controller concern to enable nested attributes with strong parameters

```ruby
class DoodadsController < ApplicationController
  include WorksCited::Params

  #...

  def doodad_params
    params.require(:doodad).permit(:name, :description, works_cited_params)
  end
end
```

## Contributing
* Check out the latest main to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone hasn't already requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it, so it doesn't break in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want your own version, or it's otherwise necessary, that's fine, but please isolate it to its own commit so it can be cherry-picked around.

## Copyright
Copyright (c) 2021-2026 Loren Lundgren. See LICENSE.txt for further details.