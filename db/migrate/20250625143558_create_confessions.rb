class CreateConfessions < ActiveRecord::Migration[8.0]
  def change
    create_table :confessions do |t|
      t.text :body
      t.string :ip

      t.timestamps
    end
  end
end
