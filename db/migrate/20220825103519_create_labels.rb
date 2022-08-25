# frozen_string_literal: true

class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.string :name, null: false, limit: 30, comment: 'ラベル名'

      t.timestamps
    end
  end
end
