# frozen_string_literal: true

json.array! @task_labels, partial: 'task_labels/task_label', as: :task_label
