A skeleton for Monk to make Sinatra MVC just like Rails.

```
	sudo gem install monk
	sudo gem install thin
	sudo gem install bundler
	git clone https://github.com/RoxasShadow/Frank
	monk init -s Frank HelloFrank # Creates a new project called 'HelloFrank' with this skeleton
	cd HelloFrank
	bundle install # may be necessary to install some libraries with your package manager, like libxslt-dev and libxml2-dev
	thin -R config.ru -p 4567 start # http://localhost:4567
```

In order to have a documentation about the controllers execute the follow commands.

```
	sudo gem install rdoc-sinatra
	rdoc
	cd doc
```
