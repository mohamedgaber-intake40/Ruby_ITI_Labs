class AddUserToArticles < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
      t.belongs_to :user
    end
  end
end
