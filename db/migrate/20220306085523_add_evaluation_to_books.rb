class AddEvaluationToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :evaluation, :floats, null: false
  end
end
