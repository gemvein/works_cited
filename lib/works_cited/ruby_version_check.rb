# frozen_string_literal: true

if RUBY_VERSION < '2.3.0' && RUBY_ENGINE == 'ruby'
  desc = if defined?(RUBY_DESCRIPTION)
           RUBY_DESCRIPTION
         else
           "ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE})"
         end
  abort <<-END_MESSAGE
    This version of WorksCited requires Ruby 2.3.0 or newer.
    You're running
      #{desc}
    Please upgrade to Ruby 2.3.0 or newer to continue.
  END_MESSAGE
end
