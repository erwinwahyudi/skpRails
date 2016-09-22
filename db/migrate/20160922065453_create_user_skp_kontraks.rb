class CreateUserSkpKontraks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_skp_kontraks do |t|

      t.timestamps
    end
  end
end
