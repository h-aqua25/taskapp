# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'labels/index', type: :view do
  let!(:labels) { create_list(:label, 11) }

  before(:each) do
    assign(:labels, labels)
  end

  it 'renders a list of labels' do
    render

    labels.each do |label|
      expect(rendered).to match(/#{label.name}/)
    end
  end
end
