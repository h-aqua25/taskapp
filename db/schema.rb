# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_826_081_058) do
  create_table 'labels', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'name', limit: 30, null: false, comment: 'ラベル名'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'task_labels', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'task_id', null: false, comment: 'タスクID'
    t.bigint 'label_id', null: false, comment: 'ラベルID'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['label_id'], name: 'index_task_labels_on_label_id'
    t.index ['task_id'], name: 'index_task_labels_on_task_id'
  end

  create_table 'tasks', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'name', null: false, comment: 'タスク名'
    t.datetime 'end_date', comment: '終了期限'
    t.integer 'priority', default: 1, comment: '優先順位: 0:低(low), 1:普通(normal), 2:高(high)'
    t.integer 'status', default: 0, comment: 'ステータス: 0:未着手(untouched), 1:着手中(touched), 2:完了(completed)'
    t.text 'explanation', comment: '説明文'
    t.bigint 'user_id', null: false, comment: 'ユーザID'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_tasks_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'task_labels', 'labels'
  add_foreign_key 'task_labels', 'tasks'
  add_foreign_key 'tasks', 'users'
end
