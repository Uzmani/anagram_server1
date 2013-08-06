get '/' do
  erb :index
end

get '/:word' do
  # Look in app/views/index.erb
  @word = params[:word]
  @anagrams = Word.new(word: @word).anagrams

  erb :index
end

post '/' do
  redirect "/#{params[:word]}"
end
