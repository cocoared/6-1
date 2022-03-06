class AddEvaluationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :evaluation, :float, null: false
  end
end
