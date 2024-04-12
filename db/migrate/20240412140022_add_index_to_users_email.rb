class AddIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    # allows for database indexing for easier lookup
    # prevents a full db scan when finding users by email address
    add_index :users, :email, unique: true
  end
end
