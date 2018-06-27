class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = landmark
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = landmark
    erb :'landmarks/edit'
  end 

  patch '/landmarks/:id' do
    landmark.update(name: params[:name], year_completed: params[:year_completed])
    redirect "/landmarks/#{landmark.id}"
  end


  def landmark
    Landmark.find(params[:id])
  end

end
