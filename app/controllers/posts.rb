# Routes and application logic relatives to the posts.
class Frank
	
  ##
  # The user goes here to send a new post by the form.
  # GET /posts/new
  ##
  get '/posts/new' do
    @post = Post.new
    erb :'posts/new'
  end

  ##
  # The user comes here by the form above.
  # POST /posts => { <i>username</i> <i>text</i> }
  ##
  post '/posts' do
    @post = Post.new(
    	:username => params[:text],
    	:text => params[:text]
    )

    if @post.save
      redirect '/'
    else
	   	@error = @post.errors.first.first
      erb :'posts/new'
    end
  end

  ##
  # All the posts in the database are showed here.
  # GET /posts
  ##
  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end
  
end
