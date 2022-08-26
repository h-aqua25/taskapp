# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'labels/new', type: :view do
  let!(:label) { build(:label) }

  before(:each) do
    assign(:label, label)
  end

  it 'renders new label form' do
    render

    assert_select 'form[action=?][method=?]', labels_path, 'post' do
      assert_select 'input[name=?]', 'label[name]'
    end
  end
end
