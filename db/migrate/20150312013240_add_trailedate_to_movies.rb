class AddTrailedateToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :trailerdate, :string
  end
end
