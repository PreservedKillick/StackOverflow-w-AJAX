class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
    end

    create_table :questions do |t|
      t.string :query
      t.belongs_to :user
   end

    create_table :answers do |t|
      t.string :response
      t.belongs_to :user
      t.belongs_to :question
   end
  end
end
