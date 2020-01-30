class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do # INDEX
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do # Load New form
    erb :new
  end

  get '/recipes/:id' do   # SHOW
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do # CREATE 
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do  # EDIT
    @recipe = Recipe.find(params[:id])
    erb :edit
   end

   patch '/recipes/:id' do #UPDATE
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    @recipe.save
    redirect to "/recipes/#{recipe.id}"
   end


  delete '/recipes/:id' do # DELETE
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
