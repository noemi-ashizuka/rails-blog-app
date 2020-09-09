class AddDefaultValueToArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :is_published, :boolean, default: false
  end
end
