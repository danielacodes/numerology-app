require 'sinatra'

get '/people/' do
  @people = Person.all
  erb :"/people/index"
end

get '/people/new' do
  @person = Person.new
  erb :"/people/new"
end

post '/people/' do
  if params[:birthday].include?("-")
    birthday = params[:birthday]
  else
    if birthday.nil?
      @error = "Oops! The data you entered isn't valid. Try again!"
      erb :"/people/new"
    else
      birthday = Date.strptime(params[:birthday], "%m%d%Y")
    end
  end

  @person = Person.new(first_name: params[:first_name], last_name: params[:last_name], birthday: birthday)
  if @person.valid?
    @person.save
    redirect "/people/#{@person.id}"
  else
    @error = "Oops! The data you entered isn't valid. Try again!"
    erb :"/people/new"
  end
end

get '/people/:id/edit' do
  @person = Person.find(params[:id])
  erb :'/people/edit'
end

put '/people/:id' do
  @person = Person.find(params[:id])
  @person.first_name = params[:first_name]
  @person.last_name = params[:last_name]
  @person.birthday = params[:birthday]

  if @person.valid?
    @person.save
    redirect "/people/#{@person.id}"
  else
    @error = "Oops! The data you entered isn't valid. Try again!"
    erb :"/people/edit"
  end
end

delete '/people/:id' do
  person = Person.find(params[:id])
  person.destroy
  redirect "/people/"
end

get '/people/:id' do
  @person = Person.find(params[:id])
  birthday_string = @person.birthday.strftime("%m%d%Y")
  birth_path_num = Person.get_birth_path_number(birthday_string)
  @message = Person.get_message(birth_path_num)
  @birthday_show = @person.birthday.strftime("%-d.%m.%Y")
  erb :"/people/show"
end
