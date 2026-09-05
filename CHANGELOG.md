# Changelog

## 1.0.0

**Breaking change.** From-the-ground-up modernization: Rails 6 support
is dropped in favor of Rails >= 7.1, < 9, and the packaging/tooling
stack is fully replaced. The `works_cited_citations`/
`works_cited_contributors` table shapes are unchanged - no data
migration is needed for existing installs - but the Ruby/Rails floor
bump, the security fix, and the JS delivery change below are real
behavior changes to check against before upgrading.

### Breaking

- **Ruby >= 3.2, Rails >= 7.1, < 9** required (was Rails >= 6, < 7).
- **`vanilla_nested` dropped entirely.** It was never actually used -
  `works_cited_link_to_add_fields` is a fully hand-rolled helper - so
  removing it has no behavior effect, but if a host app depended on it
  transitively through this gem, that's no longer the case.
- **The add/remove-contributor-fields JS is now a Stimulus controller**
  registered via importmap, not two hand-rolled scripts loaded through
  the Sprockets manifest. New runtime dependencies: `importmap-rails`,
  `stimulus-rails`, `turbo-rails`. Host apps need an importmap set up
  (the standard Rails 7+ default) for the add/remove buttons to work;
  the engine registers its own controller automatically once that's in
  place. The `data-id`/`data-fields` attribute contract on the "Add"
  link is unchanged.
- **`Citation#record=` now rejects classes that never called
  `has_works_cited`.** Previously any string of the form `"SomeClass:1"`
  was accepted and `constantize`d/`find`-ed outright - reachable through
  mass-assignment via `citation_params`/`preview_params`, so a client
  could force an arbitrary constant lookup and record fetch on any
  class in the host app. It's now checked against the class's own
  `works_cited_citations` reflection first. If your app was relying on
  `record=` accepting a class that doesn't call `has_works_cited`
  (unlikely, and not a supported use of this gem), that now silently
  no-ops instead.
- **`citations_controller#new`/`#edit`/`#create`/`#update`'s
  record-picker no longer calls `Rails.application.eager_load!` on
  every request.** It now reads from a small registry
  (`WorksCited.citable_classes`) populated when `has_works_cited` runs.
  In development/test with lazy autoloading, a citable class that
  hasn't been referenced yet by request time won't appear in the picker
  until it has been; in production (`eager_load: true`) this is a
  non-issue.

### Fixed

- **`citation_type`/`contributor_role` inclusion validators had a
  broken error message.** Both passed an `allowed_options:` key to
  `inclusion:`, which isn't a real ActiveModel option - the friendly
  "must be one of: ..." text was silently discarded and only
  ActiveModel's generic default message ever surfaced. Fixed with the
  real `message:` option.
- **The index page's Destroy link is Turbo-compatible.** It used the
  old Rails-UJS `method: :delete, data: { confirm: }` convention,
  silently inert under Turbo (Rails 7+'s default) - swapped for
  `data: { turbo_method:, turbo_confirm: }`.
- **`ActiveRecord::Base.extend WorksCited::Mixins::HasWorksCited`** now
  runs inside `ActiveSupport.on_load(:active_record)` instead of at
  module-body eval time.
- Removed five hardcoded `book?`/`periodical?`/`electronic?`/
  `interview?`/`email?` methods on `Citation` that were dead duplicates
  of what the dynamic `WorksCited.configuration.valid_citation_types`
  loop already generates - they silently shadowed the dynamic
  mechanism for anyone who'd customized `valid_citation_types`.
- `OpenStruct` is explicitly required and depended on - no longer a
  Ruby default gem as of Ruby 4.0.
- **`importmap-rails` loosened from `~> 2.0` to `>= 1.2`** - the 2.0
  floor wasn't a real requirement, just copied from a sibling gem's
  pin. Verified against 1.2.3 directly (full suite + a live browser
  check of the Stimulus controller registration).
- **The add/remove-contributor-fields JS could run before its
  dependencies loaded.** Turbo Drive re-executes `<script>` tags on
  every render, including the first page load, and its dynamically
  cloned external scripts don't preserve native parser-blocking
  execution order - so an inline script calling a function defined by
  a separately-loaded classic script could run first. Fixed by opting
  the affected script tags out of Turbo's re-execution via
  `data-turbo-eval="false"`.
- **`citation_types/citation/_default.html.haml` (the fallback partial
  used when a citation type has no dedicated template) had corrupted
  Haml** on its opening lines - a `SyntaxError` if it were ever
  rendered. Currently dead code (all six built-in types have their own
  partial) but fixed to match the working partials' pattern regardless.
- **`Contributor#full_name` produced `"Carl []"` for a handle-only
  contributor** (handle present, no first/middle/last) instead of just
  `"Carl"` - the common case for web-only sources credited by handle
  alone. Fixed to return the bare handle when there's no name to
  bracket.

### Tooling

- factory_bot (already in place), `expect`/`is_expected` syntax
  throughout (was a `%i[should expect]` mix), shoulda-matchers 6.x,
  rubocop with `rubocop-rails`/`rubocop-rspec`, GitHub Actions CI
  (lint + test matrix on Ruby 3.4/4.0 - none existed before), a
  hand-written gemspec (was Juwelier-generated) with the version
  inlined into `lib/works_cited/version.rb` instead of read from a
  standalone `VERSION` file, `database_cleaner-active_record` (was the
  deprecated monolithic `database_cleaner`), and dropped `shoulda`
  (unused, only `shoulda-matchers` was ever exercised) and `capybara`
  (unused, no feature specs).
