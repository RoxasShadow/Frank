require 'sinatra/base' # framework
require 'data_mapper' # database
require 'dm-sqlite-adapter' # sqlite database
require 'dm-serializer' # to_json, to_csv, to_yaml, to_xml methods
require 'rack/csrf' # csrf protection

class Frank < Sinatra::Base
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/database.db")
	enable :sessions
	
	@title = 'Example blog'
	
  configure do
    set :method_override, true
    set :views, settings.root + '/app/views'
    set :public_folder, settings.root + '/app/assets'
  	use Rack::Session::Cookie
  	use Rack::Csrf, :raise => true
  end

  # Require Models & Controllers
  Dir.glob("#{Dir.pwd}/app/helpers/*.rb") { |m| require m.chomp }
  Dir.glob("#{Dir.pwd}/app/models/*.rb") { |m| require m.chomp }
  Dir.glob("#{Dir.pwd}/app/controllers/*.rb") { |m| require m.chomp }

  DataMapper.finalize
  DataMapper::auto_upgrade!
end
