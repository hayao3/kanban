class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      
      # ==========このから編集する==========
      t.string      :title, null: false, limit: 255
      t.text        :memo, limit: 1000
      t.references  :list, null: false
      # ==========このまで編集する==========

      t.timestamps
    end
  end
end
