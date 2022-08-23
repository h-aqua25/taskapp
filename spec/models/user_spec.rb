# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    context 'name、email、passwordとpassword_confirmationが存在する時' do
      let!(:user) { create(:user) }

      it '登録できること' do
        expect(user).to be_valid
      end
    end
  end
end
