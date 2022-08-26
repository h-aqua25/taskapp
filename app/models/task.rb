# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels

  validates :name, presence: true, length: { maximum: 255 }

  enum :priority, {
    low: 0,    # 低
    normal: 1, # 普通
    high: 2    # 高
  }, prefix: true

  enum :status, {
    untouched: 0, # 未着手
    touched: 1,   # 着手中
    completed: 2  # 完了
  }, prefix: true

  SORT_TYPE = {
    'id_asc' => 'tasks.id ASC',
    'id_desc' => 'tasks.id DESC',
    'name_asc' => 'tasks.name ASC',
    'name_desc' => 'tasks.name DESC'
  }.freeze

  scope :search_keyword, ->(keyword) { where('CONCAT(name, explanation) LIKE ?', "%#{sanitize_sql_like(keyword)}%") }
  scope :search_status, ->(status) { where(status:) }
  scope :sort_by_keyword, ->(sort) { order(SORT_TYPE[sort]) }
end
