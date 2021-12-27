class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles,:created_at, :datetime 
    add_column :articles,:updated_at, :datetime
    # we already have timestamp in Ruby 7
    # parameters => table name, column name, datatype
  end
end
