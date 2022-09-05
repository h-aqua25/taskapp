# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'task_labels/show', type: :view do
  let!(:task_label) { create(:task_label) }

  before(:each) do
    @task_label = assign(:task_label, task_label)
  end

  it 'renders attributes in <p>' do
    render
  end
end
