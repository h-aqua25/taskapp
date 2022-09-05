# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'task_labels/index', type: :view do
  let!(:task_labels) { create_list(:task_label, 11) }

  before(:each) do
    assign(:task_labels, task_labels)
  end

  it 'renders a list of task_labels' do
    render
  end
end
