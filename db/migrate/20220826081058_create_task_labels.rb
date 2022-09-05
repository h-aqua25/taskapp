# frozen_string_literal: true

class CreateTaskLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :task_labels do |t|
      t.references :task, null: false, foreign_key: true, comment: 'タスクID'
      t.references :label, null: false, foreign_key: true, comment: 'ラベルID'
      t.timestamps
    end
  end
end
