class ChangeColumnNameInReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :available_time, :datum
  end
end
