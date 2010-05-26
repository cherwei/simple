# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simple_session',
  :secret      => 'e68a59bc0d7d9b87184710f5275df1665ab6dbabe48467f48711f0ae5dc8aa7fe75b466493cb28996eb775cd6e07cff5ac34160de369ebc927e13219f4d14bb4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
