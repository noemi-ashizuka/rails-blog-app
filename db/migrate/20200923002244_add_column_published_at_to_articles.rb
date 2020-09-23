class AddColumnPublishedAtToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :publish_at, :date
  end
end
