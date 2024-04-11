# config/initializers/server_startup.rb

Rails.application.config.after_initialize do
  Earthquake.populate_db
end
