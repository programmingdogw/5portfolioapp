# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( new.scss )
Rails.application.config.assets.precompile += %w( new_address.scss )
Rails.application.config.assets.precompile += %w( create_address.scss )
Rails.application.config.assets.precompile += %w( sessions_new.scss )


Rails.application.config.assets.precompile += %w( home_index.scss )
Rails.application.config.assets.precompile += %w( search.scss )


Rails.application.config.assets.precompile += %w( users.scss )
Rails.application.config.assets.precompile += %w( users_show.scss )
Rails.application.config.assets.precompile += %w( users_edit.scss )


Rails.application.config.assets.precompile += %w( items_new.scss )
Rails.application.config.assets.precompile += %w( items_edit.scss )
Rails.application.config.assets.precompile += %w( items_show.scss )
Rails.application.config.assets.precompile += %w( items_done.scss )


Rails.application.config.assets.precompile += %w( categories_index.scss )
Rails.application.config.assets.precompile += %w( categories_show.scss )




