class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string:title#カラム
      t.string:body#カラム
      t.timestamps
    end
  end
end
