require "sinatra"

get "/" do
  erb :index
end

post "/" do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = "Thank you!"
  @message = "Dear #{@user_name} we'll be waiting you at #{@date_time}"

  f = File.open "users.txt", "a"
  f.write "User: #{@user_name}, Phone: #{@phone}, Date: #{@date_time}\n"
  f.close

  erb :message
end

get "/admin" do
  erb :admin
end

post "/admin" do
  @name = params[:name]
  @password = params[:password]

  if @name == "admin" && @password == "secret"
    @f = File.open "users.txt", "r"
    @f_content = @f.read
    @f.close

    erb :users
  else
    @access = "Acsess Denied!"
    erb :admin
  end
end
