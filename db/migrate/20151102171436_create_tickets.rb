class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.string :created_by
      t.string :created_by_email
      t.boolean :status

      t.timestamps null: false
    end
  end
end
