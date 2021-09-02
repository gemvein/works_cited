# Works Cited
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
$ rails g works_cited:install
```

You will need to add access for the people who should be authorized. Works Cited uses CanCanCan for authorization. Simply add the appropriate permissions to your ability.rb file:

```ruby
class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    can :read, WorksCited::Citation
    can :read, WorksCited::Contributor
    
    return if user.new_record? # Anonymous Users leave
    
    # # We could have other rules in here, like:
    # can :manage, WorksCited::Citation, record: { user_id: user.id }
    # can :manage, WorksCited::Contributor, record: { user_id: user.id }
    
    return unless user.admin? # Non Admin Users leave
    
    can :manage, WorksCited::Citation
    can :manage, WorksCited::Contributor
  end
end
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

## Contributing
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
