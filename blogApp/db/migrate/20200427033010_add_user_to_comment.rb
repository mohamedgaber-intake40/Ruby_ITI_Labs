class AddUserToComment < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      t.belongs_to :user
    end
  end

end
