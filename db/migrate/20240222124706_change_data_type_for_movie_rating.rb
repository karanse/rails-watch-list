class ChangeDataTypeForMovieRating < ActiveRecord::Migration[7.1]
  def change
    change_column(:movies, :rating, :decimal, precision: 2, scale: 1, using: 'rating::numeric')
  end
end
