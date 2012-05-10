# Database model. Explains what the posts are.
class Post
  include DataMapper::Resource

  property	:id, Serial
  property	:username, String,
						:required => true, # error if not present
						:length => 4..16, # min 4 and max 16 characters.
						:format => /\A[a-zA-Z0-9_]*\z/, # username must contains only letters, digits, or underscores.
						:messages => { # if requires above are not respected
							:presence => 'Username is required',
							:format => 'Username must contains only letters, digits, or underscores.',
							:length => 'Username length must be including between 4 and 16 characters.'
						}
  property	:text, Text,
						:required => true, # error if not present
						:messages => { # if requires above are not respected
							:presence => 'Text is required',
						}
  property	:created_at,	DateTime
  
  validates_length_of :text, :minimum => 1
  
  before :save, :purge
  def purge
  	self.username = Rack::Utils.escape_html(self.username)
  	self.text = Rack::Utils.escape_html(self.text)
  end
end
