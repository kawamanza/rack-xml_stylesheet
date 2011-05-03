# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails23_root_session',
  :secret      => 'aa0362b84c7439b76ceaa554132974b37ba228122ef643361342bf84a24db4d1f1f243a45dc591a8c25ac58b25e3a92a09a413175ec21c3a47068eeca6752ce3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
