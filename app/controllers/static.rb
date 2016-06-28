get '/' do
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  @urls = Url.all
  erb :"index"
end

post '/form' do
	@temp = Url.create(long_url: params[:long_url], short_url: Url.shorten)
	redirect '/'
end

get '/:short_url' do
	@temp = Url.find_by(short_url: params[:short_url])
	redirect "http://" + @temp.long_url
end