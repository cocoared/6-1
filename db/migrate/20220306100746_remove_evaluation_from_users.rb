class RemoveEvaluationFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :evaluation, :float
  end
end
