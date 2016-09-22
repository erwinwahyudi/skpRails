class CreateUserSkpKerjas < ActiveRecord::Migration[5.0]
  def change
    create_table :user_skp_kerjas do |t|

      t.timestamps
    end
  end
end
