class AddOrderNoToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :order_no, :integer, default: 0
  end
end
