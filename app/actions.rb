# Homepage (Root path)
@@salt = "$2a$10$xl3fsmrj9DJqeSNJvX3wCe"

def crypt(text)
  BCrypt::Engine.hash_secret text, @@salt
end

# before "/songs" do
#   @user = User.find(session[:id])
# end

# def current_user
#   @user
# end

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
  @user = User.where(name: params[:name]).first
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
  @song = Song.new(params)
  erb :'songs/show'
end

post '/songs' do
  @user = User.find(session[:id])
  @song = @user.songs.build(params[:song]) # <- OMG Check this out! it uses the 'before' filtre above
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/vote/:id' do
  if session[:id]
    @user = User.find(session[:id].to_i)
    @song = Song.find(params[:id].to_i)
    @vote = Upvote.where('user_id = ? AND song_id = ?', @user.id, @song.id)
    if @vote.empty?
      Upvote.create(
        user_id: @user.id,
        song_id: @song.id
      )
    else
      @vote[0].destroy
    end
  else
    redirect '/login'
  end
  redirect '/songs'
end








