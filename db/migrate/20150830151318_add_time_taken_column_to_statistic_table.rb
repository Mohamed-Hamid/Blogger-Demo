class AddTimeTakenColumnToStatisticTable < ActiveRecord::Migration
  def change
    add_column :statistics, :time_taken, :decimal
  end
end
