get '/' do
  erb :"index"
end

post '/form' do
  @temp = Url.new(long_url: params[:long_url], short_url: Url.shorten)
  if @temp.save
  	# erb :"index"
    status 200
    @temp.to_json
  else
    status 400
    @errors = "#{@temp.errors.full_messages.join(" ")}"
    { error: @errors }.to_json
  end
end

get '/:short_url' do
	@temp = Url.find_by(short_url: params[:short_url])
	@temp.click_count += 1
	@temp.save
	
	if @temp.long_url.match(/http[s]?/) == nil
        redirect "http://" + "#{@temp.long_url}"

    else
        redirect "#{@temp.long_url}"
    end

end