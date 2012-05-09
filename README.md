A skeleton to make Sinatra MVC just like Rails.
Includes jQuery, CSRF and XSS protection, serializer methods (like to_json and to_xml) and the DataMapper ORM.
Let's start customizing controllers, models and views.
Enjoy!

```
sudo gem install thin
sudo gem install bundler
git clone https://github.com/RoxasShadow/Frank
cd Frank
bundle install # may be necessary to install some libraries with your package manager, like libxslt-dev and libxml2-dev
thin -R config.ru -p 4567 start # http://localhost:4567
```

In order to have a documentation about the controllers execute the follow commands.

```
sudo gem install rdoc-sinatra
rdoc app/controllers/*
cd doc
```
