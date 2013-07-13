class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # When creating a column in a database, if it will be used to find records the column should be Indexed as follows. 

    add_index :users, :email, unique: true

    # Without an Index the only way to find a user by email address is to look through each user row in the database and compare its email attribute to the given email. This is known as a full-table scan, and for a real site with thousands of users it's very inefficient.

  end
end
