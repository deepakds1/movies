class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  def index
     # @movies = Movie.all
    # @movies = Movie.find_by_name(params[:name]) if params[:name].present?
    @movies = Movie.all.order('order_no ASC')
  end

  def new
    @movie = Movie.new
  end

  def edit
    # @movie = Movie.find(params[:id])
  end

  # def create
  #   @movie = Movie.new(movie_params)
  #   @movie.save
  #   respond_to do |format|
  #     format.html { redirect_to Movie}
  #     format.js
  #   end
  # end
  def create
    @movie = Movie.create!(user_params)
    @movie.save
    respond_to do |format|

        format.html { redirect_to Movie, notice: 'Movie was successfully created.' }


    end
  end



  def show
    @movie = Movie.find(params[:id])
  end

  def sort
    # reading
    params[:changed_orders].values.each do |param|
      #update
      @movie = Movie.find(param[:id])
      @movie.order_no = param[:order_no]
      @movie.save!
    end
      render text: 'success'
  end
  def rate
  #binding.pry
    @movie = Movie.find(params[:movie_id])
    @movie.rating = params[:ratings]
    @movie.save!
  end
  def user_params
    params.require(:movie).permit(:name, :realese, :actor, :director, :ratings)
  end
end


   # def update
   #   respond_to do |format|
   #     if @movie.update(movie_params)
   #       format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
   #       format.json { render :show, status: :ok, location: @movie }
   #     else
   #       format.html { render :edit }
   #       format.json { render json: @movie.errors, status: :unprocessable_entity }
   #     end
   #   end




