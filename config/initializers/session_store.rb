# Be sure to restart your server when you modify this file.

RegistrationApp::Application.config.session_store :cookie_store, :key => '_registration_app2_secure_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# RegistrationApp::Application.config.session_store :active_record_store
