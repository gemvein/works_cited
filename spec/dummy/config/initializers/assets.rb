# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# importmap-rails pins resolve through Sprockets here (this app stays on
# Sprockets rather than Propshaft) - every pinned module path needs an
# explicit precompile declaration, unlike Propshaft which just serves
# whatever's on disk. application.js is declared via manifest.js's own
# `//= link` directive; declare the Stimulus bootstrap files here. The
# engine declares its own controllers/works_cited/*.js separately, in
# lib/works_cited/engine.rb.
Rails.application.config.assets.precompile += %w[controllers/application.js controllers/index.js]
