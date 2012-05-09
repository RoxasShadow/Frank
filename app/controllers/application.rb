# Routes and application logic.
class Frank

  ##
  # Shows the home.
  # GET /
  ##
  get '/' do
    erb :index
  end

  ##
  # 404 error page
  # GET
  ##
  not_found do
    erb :404
  end

  ##
  # Generic error page
  # GET
  ##
  error do
  	@error = env['sinatra.error']
    erb :error
  end
  
  ##
  # Just for fun...
  # GET /hi
  ##
  get '/hi' do
  	'Hi!'
  end
  
  ##
  # Shows the about page.
  # GET /about
  ##
  get '/about' do
    erb :about
  end
  
end
