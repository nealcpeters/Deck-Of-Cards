get '/user/new' do
  
  erb :"/user/new"
end

get '/user/sign_in' do
  
  erb :"user_views/sign_in"
end 

get '/user/:id' do 
  
  erb :"user_views/show"
end

get '/user/edit/:id' do

  erb :"user_views/edit"
end

post '/user/new' do
  
  user = User.new({
  	email: params[:email],
  	password: params[:password],
  	password_confirmation: params[:password_confirmation]
  	})
  if user.save?
    session[:user_id] = user.id
    redirect to('/user/new')
  else
  	@errors = user.errors.messages
  	erb :"/user/new"
  end
end
