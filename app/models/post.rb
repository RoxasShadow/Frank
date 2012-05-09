# Database model. Explains what the posts are.
class Post
  include DataMapper::Resource

  property	:id, Serial
  property	:username, String,
						:required => true, # error if not present
						:length => 4..16, # min 4 and max 16 characters.
						:format => /[a-zA-Z0-9_]/, # username must contains only letters, digits, or underscores.
						:messages => { # if requires above are not respected
							:presence => 'Username is required',
							:format => 'Username must contains only letters, digits, or underscores.',
							:length => 'Username length must be including betweet 4 and 16 characters.'
						}
  property	:text, Text,
						:required => true, # error if not present
						:length => 1..65535, # min 1 and max 65535 characters.
						:messages => { # if requires above are not respected
							:presence => 'Text is required',
							:length => 'Text length must be including betweet 1 and 65535 characters.'
						}
  property	:created_at,	DateTime
  
  sanitize :default_mode => :basic # remove this line if you want to enable the html in the posts
end
