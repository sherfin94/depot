require 'rails_helper'

describe 'homepage', type: :request do
  it 'displays number of orders upon login' do
    user = FactoryGirl.build(:user, name: 'sherfin', password: 'hellohell1432')
    visit '/login'
    fill_in 'name', with: "sherfin"
    fill_in 'password', with: 'hellohell1432'
    click_button 'login'

    expect(page).to have_selector('orders_count_report', text: "we have 0 orders")
  end
end
