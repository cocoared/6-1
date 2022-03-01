class AddBookIdToRelationship < ActiveRecord::Migration[6.1]
  def change
    add_column :relationships, :book_id, :integer
  end
end
