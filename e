2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=2ms bytes=922
2011-04-27T04:57:42+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:42 -0700 2011
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:42+00:00 app[web.1]:   
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-26T21:57:42-07:00 heroku[nginx]: GET /newregistration HTTP/1.0 | 127.0.0.1 | 63751 | http | 200
2011-04-26T21:57:42-07:00 heroku[nginx]: GET /newregistration HTTP/1.1 | 76.31.29.232 | 6787 | https | 200
2011-04-26T21:57:43-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 948 | http | 404
2011-04-26T21:57:43-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 953 | https | 404
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: Started GET "/registrations" for 76.31.29.232 at Tue Apr 26 21:57:46 -0700 2011
2011-04-27T04:57:46+00:00 app[web.1]:   Processing by RegistrationsController#index as HTML
2011-04-27T04:57:46+00:00 app[web.1]: Rendered registrations/_navigation.html.erb (0.6ms)
2011-04-27T04:57:46+00:00 app[web.1]: Rendered layouts/_stylesheets.html.erb (1.5ms)
2011-04-27T04:57:46+00:00 app[web.1]: Rendered layouts/_header.html.erb (1.0ms)
2011-04-27T04:57:46+00:00 app[web.1]: Rendered registrations/index.html.erb within layouts/application (5.4ms)
2011-04-27T04:57:46+00:00 app[web.1]: Completed 200 OK in 17ms (Views: 5.9ms | ActiveRecord: 9.1ms)
2011-04-27T04:57:46+00:00 heroku[router]: GET nwfregistration.heroku.com/registrations dyno=web.1 queue=0 wait=0ms service=23ms bytes=3446
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /registrations HTTP/1.0 | 127.0.0.1 | 3493 | http | 200
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /registrations HTTP/1.1 | 76.31.29.232 | 1546 | https | 200
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:46 -0700 2011
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:46+00:00 app[web.1]:   
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=2ms bytes=922
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 948 | http | 404
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 953 | https | 404
2011-04-27T04:57:52+00:00 app[web.1]: 
2011-04-27T04:57:52+00:00 app[web.1]: 
2011-04-27T04:57:52+00:00 app[web.1]: Started GET "/deleteregistration?id=2" for 76.31.29.232 at Tue Apr 26 21:57:52 -0700 2011
2011-04-27T04:57:52+00:00 app[web.1]:   Processing by RegistrationsController#destroy as HTML
2011-04-27T04:57:52+00:00 app[web.1]:   Parameters: {"id"=>"2"}
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /deleteregistration?id=2 HTTP/1.0 | 127.0.0.1 | 891 | http | 302
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /deleteregistration?id=2 HTTP/1.1 | 76.31.29.232 | 896 | https | 302
2011-04-27T04:57:52+00:00 app[web.1]: Redirected to https://nwfregistration.heroku.com/registrations
2011-04-27T04:57:52+00:00 app[web.1]: Completed 302 Found in 26ms
2011-04-27T04:57:52+00:00 heroku[router]: GET nwfregistration.heroku.com/deleteregistration dyno=web.1 queue=0 wait=0ms service=29ms bytes=845
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: Started GET "/registrations" for 76.31.29.232 at Tue Apr 26 21:57:53 -0700 2011
2011-04-27T04:57:53+00:00 app[web.1]:   Processing by RegistrationsController#index as HTML
2011-04-27T04:57:53+00:00 app[web.1]: Rendered registrations/_navigation.html.erb (0.6ms)
2011-04-27T04:57:53+00:00 app[web.1]: Rendered layouts/_stylesheets.html.erb (1.4ms)
2011-04-27T04:57:53+00:00 app[web.1]: Rendered layouts/_header.html.erb (1.0ms)
2011-04-27T04:57:53+00:00 app[web.1]: Rendered registrations/index.html.erb within layouts/application (7.9ms)
2011-04-27T04:57:53+00:00 app[web.1]: Completed 200 OK in 14ms (Views: 6.4ms | ActiveRecord: 30.5ms)
2011-04-27T04:57:53+00:00 heroku[router]: GET nwfregistration.heroku.com/registrations dyno=web.1 queue=0 wait=0ms service=22ms bytes=3383
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /registrations HTTP/1.0 | 127.0.0.1 | 3431 | http | 200
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /registrations HTTP/1.1 | 76.31.29.232 | 1709 | https | 200
2011-04-27T04:57:53+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=4ms bytes=922
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 947 | http | 404
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 952 | https | 404
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:53 -0700 2011
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:53+00:00 app[web.1]:   
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: Started GET "/deleteregistration?id=1" for 76.31.29.232 at Tue Apr 26 21:57:56 -0700 2011
2011-04-27T04:57:56+00:00 app[web.1]:   Processing by RegistrationsController#destroy as HTML
2011-04-27T04:57:56+00:00 app[web.1]:   Parameters: {"id"=>"1"}
2011-04-27T04:57:56+00:00 heroku[router]: GET nwfregistration.heroku.com/deleteregistration dyno=web.1 queue=0 wait=0ms service=12ms bytes=845
2011-04-27T04:57:56+00:00 app[web.1]: Redirected to https://nwfregistration.heroku.com/registrations
2011-04-27T04:57:56+00:00 app[web.1]: Completed 302 Found in 9ms
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]:   Processing by RegistrationsController#index as HTML
2011-04-27T04:57:56+00:00 app[web.1]: Rendered registrations/_navigation.html.erb (0.6ms)
2011-04-27T04:57:56+00:00 app[web.1]: Rendered layouts/_stylesheets.html.erb (1.7ms)
2011-04-27T04:57:56+00:00 heroku[router]: GET nwfregistration.heroku.com/registrations dyno=web.1 queue=0 wait=0ms service=19ms bytes=3102
2011-04-27T04:57:56+00:00 app[web.1]: Rendered layouts/_header.html.erb (1.1ms)
2011-04-27T04:57:56+00:00 app[web.1]: Rendered registrations/index.html.erb within layouts/application (5.5ms)
2011-04-27T04:57:56+00:00 app[web.1]: Completed 200 OK in 12ms (Views: 6.2ms | ActiveRecord: 11.5ms)
2011-04-26T21:57:56-07:00 heroku[nginx]: GET /deleteregistration?id=1 HTTP/1.0 | 127.0.0.1 | 891 | http | 302
2011-04-26T21:57:56-07:00 heroku[nginx]: GET /deleteregistration?id=1 HTTP/1.1 | 76.31.29.232 | 896 | https | 302
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=3ms bytes=922
2011-04-27T04:57:56+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:56 -0700 2011
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:56+00:00 app[web.1]:   
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /registrations HTTP/1.0 | 127.0.0.1 | 3149 | http | 200
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /registrations HTTP/1.1 | 76.31.29.232 | 1612 | https | 200
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 947 | http | 404
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 952 | https | 404
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=2ms bytes=922
2011-04-27T04:57:42+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:42 -0700 2011
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:42+00:00 app[web.1]:   
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-27T04:57:42+00:00 app[web.1]: 
2011-04-26T21:57:42-07:00 heroku[nginx]: GET /newregistration HTTP/1.0 | 127.0.0.1 | 63751 | http | 200
2011-04-26T21:57:42-07:00 heroku[nginx]: GET /newregistration HTTP/1.1 | 76.31.29.232 | 6787 | https | 200
2011-04-26T21:57:43-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 948 | http | 404
2011-04-26T21:57:43-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 953 | https | 404
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: Started GET "/registrations" for 76.31.29.232 at Tue Apr 26 21:57:46 -0700 2011
2011-04-27T04:57:46+00:00 app[web.1]:   Processing by RegistrationsController#index as HTML
2011-04-27T04:57:46+00:00 app[web.1]: Rendered registrations/_navigation.html.erb (0.6ms)
2011-04-27T04:57:46+00:00 app[web.1]: Rendered layouts/_stylesheets.html.erb (1.5ms)
2011-04-27T04:57:46+00:00 app[web.1]: Rendered layouts/_header.html.erb (1.0ms)
2011-04-27T04:57:46+00:00 app[web.1]: Rendered registrations/index.html.erb within layouts/application (5.4ms)
2011-04-27T04:57:46+00:00 app[web.1]: Completed 200 OK in 17ms (Views: 5.9ms | ActiveRecord: 9.1ms)
2011-04-27T04:57:46+00:00 heroku[router]: GET nwfregistration.heroku.com/registrations dyno=web.1 queue=0 wait=0ms service=23ms bytes=3446
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /registrations HTTP/1.0 | 127.0.0.1 | 3493 | http | 200
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /registrations HTTP/1.1 | 76.31.29.232 | 1546 | https | 200
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:46 -0700 2011
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:46+00:00 app[web.1]:   
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 app[web.1]: 
2011-04-27T04:57:46+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=2ms bytes=922
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 948 | http | 404
2011-04-26T21:57:46-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 953 | https | 404
2011-04-27T04:57:52+00:00 app[web.1]: 
2011-04-27T04:57:52+00:00 app[web.1]: 
2011-04-27T04:57:52+00:00 app[web.1]: Started GET "/deleteregistration?id=2" for 76.31.29.232 at Tue Apr 26 21:57:52 -0700 2011
2011-04-27T04:57:52+00:00 app[web.1]:   Processing by RegistrationsController#destroy as HTML
2011-04-27T04:57:52+00:00 app[web.1]:   Parameters: {"id"=>"2"}
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /deleteregistration?id=2 HTTP/1.0 | 127.0.0.1 | 891 | http | 302
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /deleteregistration?id=2 HTTP/1.1 | 76.31.29.232 | 896 | https | 302
2011-04-27T04:57:52+00:00 app[web.1]: Redirected to https://nwfregistration.heroku.com/registrations
2011-04-27T04:57:52+00:00 app[web.1]: Completed 302 Found in 26ms
2011-04-27T04:57:52+00:00 heroku[router]: GET nwfregistration.heroku.com/deleteregistration dyno=web.1 queue=0 wait=0ms service=29ms bytes=845
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: Started GET "/registrations" for 76.31.29.232 at Tue Apr 26 21:57:53 -0700 2011
2011-04-27T04:57:53+00:00 app[web.1]:   Processing by RegistrationsController#index as HTML
2011-04-27T04:57:53+00:00 app[web.1]: Rendered registrations/_navigation.html.erb (0.6ms)
2011-04-27T04:57:53+00:00 app[web.1]: Rendered layouts/_stylesheets.html.erb (1.4ms)
2011-04-27T04:57:53+00:00 app[web.1]: Rendered layouts/_header.html.erb (1.0ms)
2011-04-27T04:57:53+00:00 app[web.1]: Rendered registrations/index.html.erb within layouts/application (7.9ms)
2011-04-27T04:57:53+00:00 app[web.1]: Completed 200 OK in 14ms (Views: 6.4ms | ActiveRecord: 30.5ms)
2011-04-27T04:57:53+00:00 heroku[router]: GET nwfregistration.heroku.com/registrations dyno=web.1 queue=0 wait=0ms service=22ms bytes=3383
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /registrations HTTP/1.0 | 127.0.0.1 | 3431 | http | 200
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /registrations HTTP/1.1 | 76.31.29.232 | 1709 | https | 200
2011-04-27T04:57:53+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=4ms bytes=922
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 947 | http | 404
2011-04-26T21:57:53-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 952 | https | 404
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:53 -0700 2011
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:53+00:00 app[web.1]:   
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:53+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: Started GET "/deleteregistration?id=1" for 76.31.29.232 at Tue Apr 26 21:57:56 -0700 2011
2011-04-27T04:57:56+00:00 app[web.1]:   Processing by RegistrationsController#destroy as HTML
2011-04-27T04:57:56+00:00 app[web.1]:   Parameters: {"id"=>"1"}
2011-04-27T04:57:56+00:00 heroku[router]: GET nwfregistration.heroku.com/deleteregistration dyno=web.1 queue=0 wait=0ms service=12ms bytes=845
2011-04-27T04:57:56+00:00 app[web.1]: Redirected to https://nwfregistration.heroku.com/registrations
2011-04-27T04:57:56+00:00 app[web.1]: Completed 302 Found in 9ms
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]:   Processing by RegistrationsController#index as HTML
2011-04-27T04:57:56+00:00 app[web.1]: Rendered registrations/_navigation.html.erb (0.6ms)
2011-04-27T04:57:56+00:00 app[web.1]: Rendered layouts/_stylesheets.html.erb (1.7ms)
2011-04-27T04:57:56+00:00 heroku[router]: GET nwfregistration.heroku.com/registrations dyno=web.1 queue=0 wait=0ms service=19ms bytes=3102
2011-04-27T04:57:56+00:00 app[web.1]: Rendered layouts/_header.html.erb (1.1ms)
2011-04-27T04:57:56+00:00 app[web.1]: Rendered registrations/index.html.erb within layouts/application (5.5ms)
2011-04-27T04:57:56+00:00 app[web.1]: Completed 200 OK in 12ms (Views: 6.2ms | ActiveRecord: 11.5ms)
2011-04-26T21:57:56-07:00 heroku[nginx]: GET /deleteregistration?id=1 HTTP/1.0 | 127.0.0.1 | 891 | http | 302
2011-04-26T21:57:56-07:00 heroku[nginx]: GET /deleteregistration?id=1 HTTP/1.1 | 76.31.29.232 | 896 | https | 302
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 heroku[router]: GET nwfregistration.heroku.com/javascripts/all.js dyno=web.1 queue=0 wait=0ms service=3ms bytes=922
2011-04-27T04:57:56+00:00 app[web.1]: Started GET "/javascripts/all.js" for 76.31.29.232 at Tue Apr 26 21:57:56 -0700 2011
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: ActionController::RoutingError (No route matches "/javascripts/all.js"):
2011-04-27T04:57:56+00:00 app[web.1]:   
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-27T04:57:56+00:00 app[web.1]: 
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /registrations HTTP/1.0 | 127.0.0.1 | 3149 | http | 200
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /registrations HTTP/1.1 | 76.31.29.232 | 1612 | https | 200
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.0 | 127.0.0.1 | 947 | http | 404
2011-04-26T21:57:57-07:00 heroku[nginx]: GET /javascripts/all.js HTTP/1.1 | 76.31.29.232 | 952 | https | 404
