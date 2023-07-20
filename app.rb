require 'sinatra'
require 'sinatra/reloader' if development?

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  "Hello world!"
end

post '/create_person' do
  first_name = params[:first_name]
  second_name = params[:second_name]
  city = params[:city]
  date_of_birth = params[:date_of_birth]

  if first_name.empty? || second_name.empty? || city.empty?
    return "Fill in all required fields (first and second name, city)"
  end

  birth_date_message = date_of_birth.empty? ? "Date of birth is unknown" : "Date of birth: #{date_of_birth}"

  "Person is added to the records! Full name: #{first_name} #{second_name}, City: #{city}, #{birth_date_message}"
end

get '/added_person_form' do
  erb :create_person_form
end
