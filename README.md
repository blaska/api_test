# API Test

## Setup

In your terminal:

```
$ git clone git://github.com/blaska/api_test.git
$ cd api_test
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s
```

Visit [http://localhost:3000/oauth/applications](http://localhost:3000/oauth/applications)

Create an application:

  * Name: api_client
  * Redirect URI: urn:ietf:wg:oauth:2.0:oob

Once created, hang on to the application id & secret key.  Example:

```
Callback url:
urn:ietf:wg:oauth:2.0:oob

Application Id:
b771ce7171eaf06cfe350133df0259c3e72c262e8e03058c27d64307f8ba71b9

Secret:
ccd35744ea20310b9ba1b931ad9e4c2596f6c751df441c1657f2e4284f4dad05
```

## Scripting

```ruby

#!/usr/bin/env ruby

require 'oauth2'

app_id    = 'b771ce7171eaf06cfe350133df0259c3e72c262e8e03058c27d64307f8ba71b9' # Note: use the one you created in the previous step
secret    = 'ccd35744ea20310b9ba1b931ad9e4c2596f6c751df441c1657f2e4284f4dad05' # Note: use the one you created in the previous step
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
```

Expected output:

```
Getting listing of JavaScripts:
{"body"=>"alert(\"It works!\");", "created_at"=>"2013-01-20T17:08:59Z", "id"=>1, "name"=>"file1", "updated_at"=>"2013-01-20T17:08:59Z"}
Getting first Javascript:
{"body"=>"alert(\"It works!\");", "created_at"=>"2013-01-20T17:08:59Z", "id"=>1, "name"=>"file1", "updated_at"=>"2013-01-20T17:08:59Z"}
Creating new Javascript
{"body"=>"console.log(foo);", "created_at"=>"2013-01-20T19:09:00Z", "id"=>29, "name"=>"file10", "updated_at"=>"2013-01-20T19:09:00Z"}
```
