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
# app/assets
 Rails.application.config.assets.precompile += %w( site.css site.js user_devise.css user_devise.js admin_devise.css admin_devise.js admins_backoffice.css admins_backoffice.js users_backoffice.css users_backoffice.js)
# lib/assets
 Rails.application.config.assets.precompile += %w( jquery-3.3.1-slim.min.js starter-template.css sb-admin-2.css sb-admin-2.js custom.css custom.js img.jpg user.png)
 # vendor/assets
 Rails.application.config.assets.precompile += %w( jquery-2.2.3/dist/jquery.js bootstrap-3.4.1/dist/css/bootstrap.js )
