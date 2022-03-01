class RemoveBookIdFromRelationship < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :book_id, :integer
  end
end
