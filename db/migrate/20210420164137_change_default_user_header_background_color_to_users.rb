class ChangeDefaultUserHeaderBackgroundColorToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :background, from: nil, to: "#005a55"

    reversible do |dir|
      dir.up { User.where(background: nil).update_all(background: "#005a55") }
    end
  end
end
