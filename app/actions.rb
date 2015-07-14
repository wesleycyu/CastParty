# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  @user = User.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.new(id: params[:id])
  erb :'songs/show'
end

post '/songs' do
  @user = User.new(
    email: params[:email]
  )
  @user.save
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url],
    user_id: @user.id
  )
byebug
  if @song.save
    redirect '/songs'
  else
    puts "ERROR"
    erb :'songs/new'
  end
end
