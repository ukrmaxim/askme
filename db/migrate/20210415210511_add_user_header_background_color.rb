class AddUserHeaderBackgroundColor < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :background, :string
  end
end
