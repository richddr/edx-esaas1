class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.ratings_list
    @selected_ratings = params['ratings'] != nil ? params['ratings'] : Hash.new
    @selected_ratings = (session[:settings].nil? ? @all_ratings: session[:settings][0]) if @selected_ratings.empty?
    sb = params[:sort_by].nil? ? (session[:settings] != nil ? session[:settings][1] : 'none'): params[:sort_by]
    case sb
      when 'm_title'
        # @movies.sort_by!{|movie| movie.title}
        @movies = @selected_ratings.empty? ? Movie.order("title").where({rating: @all_ratings}):Movie.order("title").where({rating: @selected_ratings.keys})
        @m =  true
      when 'm_release'
        # @movies.sort_by!{|movie| movie.release_date}
        @movies = @selected_ratings.empty? ? Movie.where({rating: @all_ratings}).order("release_date"):Movie.where({rating: @selected_ratings.keys}).order("release_date")
        @r = true
      else
        @movies = @selected_ratings.empty? ? Movie.where({rating: @all_ratings}):Movie.where({rating: @selected_ratings.keys})
    end
    session[:settings] = [@selected_ratings, sb]
    flash.keep
    # redirect_to movies_path(:ratings => @selected_ratings, :sort_by => sb)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
