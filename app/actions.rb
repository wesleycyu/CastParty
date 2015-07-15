# Homepage (Root path)
@@salt = "$2a$10$xl3fsmrj9DJqeSNJvX3wCe"

def crypt(text)
  BCrypt::Engine.hash_secret text, @@salt
end

get '/' do
  erb :index
end

get '/signup' do
  @user = User.new
  erb :'signup/index'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    name: params[:name],
    password: crypt(params[:password])
  )
  if @user.save
    session[:id]
    redirect '/songs'
  else
    erb :'signup/index'
  end
end

get '/login' do
  @user = User.new
  erb :'login/index'
end

post '/login' do
  @user = User.where('name = ?', params[:name])[0]
  @password = BCrypt::Engine.hash_secret params[:password], @@salt
  if @user.password == @password
    session[:id] = @user.id
    redirect '/songs'
  else
    erb :'/login'
  end
end

get '/logout' do
  session.clear
  redirect to('/login')
end


get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  if session[:id]
    @song = Song.new
    erb :'songs/new'
  else
    redirect '/login'
  end
end

get '/songs/:id' do
  @song = Song.new(id: params[:id])
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url],
    user_id: session[:id]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/upvote/:id' do
  if session[:id]
    @user = User.find(session[:id])
    @song = Song.find(params[:id])






