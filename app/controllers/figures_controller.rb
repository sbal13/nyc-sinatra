class FiguresController < ApplicationController
	get "/figures/new" do
		@figure = Figure.new
		@titles = Title.all
		@landmarks = Landmark.all

		erb :'figures/new'
	end

	post '/figures' do
		@figure = Figure.find_or_create_by(name: params[:name])

		params[:title].each do |title_id|
			title = Title.find(title_id)
			@figure.titles << title
		end

		if params[:new_title] != ""
			new_title = Title.find_or_create_by(name: params[:new_title])
			new_title.figures << @figure
		end

		params[:landmark].each do |landmark_id|
			landmark = Landmark.find(landmark_id)
			@figure.landmarks << landmark
		end

		if params[:new_landmark_name] != "" && params[:new_landmark_year_completed] != ""
			new_landmark = Landmark.find_or_create_by(name: params[:new_landmark_name], year_completed: params[:new_landmark_year_completed], figure: @figure)
		end

		binding.pry

	end
end