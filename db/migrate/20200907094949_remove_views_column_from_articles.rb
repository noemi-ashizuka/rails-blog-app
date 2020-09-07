class RemoveViewsColumnFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :views, :integer, default: 0
  end
end
