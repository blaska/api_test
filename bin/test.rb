#!/usr/bin/env ruby

require 'oauth2'

#callback  = 'urn:ietf:wg:oauth:2.0:oob'
app_id    = 'b771ce7171eaf06cfe350133df0259c3e72c262e8e03058c27d64307f8ba71b9'
secret    = 'ccd35744ea20310b9ba1b931ad9e4c2596f6c751df441c1657f2e4284f4dad05'
site      = 'http://localhost:3000/'
email     = 'test@example.com'
password  = 'password'


client = OAuth2::Client.new(app_id, secret, site: site)

access = client.password.get_token(email, password)

puts 'Getting listing of JavaScripts:'

puts access.get('/api/javascripts.json').parsed

puts 'Getting first Javascript:'

puts access.get('/api/javascripts/1.json').parsed

puts 'Creating new Javascript'

puts access.post('/api/javascripts.json', {:body => {:api_javascript => {:name => 'file10', :body => 'console.log(foo);'}}}).parsed
