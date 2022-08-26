# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'labels/show', type: :view do
  let!(:label) { create(:label) }

  before(:each) do
    @label = assign(:label, label)
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match(/#{label.name}/)
  end
end
