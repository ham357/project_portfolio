class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :title,          null:false, index: true
      t.text      :description,      null:false
      t.references     :user,           foreign_key: true, null:false
      t.timestamps
    end
  end
end
