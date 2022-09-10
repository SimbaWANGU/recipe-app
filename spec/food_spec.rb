require 'rails_helper'

RSpec.describe 'Food page', type: :feature do
  before :each do
    @user = User.new(name: 'Chris', email: 'chris@gmail.com', password: 'asdasd')
    @user.save

    visit '/users/sign_in'
    fill_in 'Email', with: 'chris@gmail.com'
    fill_in 'Password', with: 'asdasd'
    click_button 'Log in'
  end

  it 'should be able to see Foods' do
    expect(page).to have_content('Foods')
  end

  it 'should be able to redirect to add food route' do
    visit '/foods'
    click_link 'Add Food'
    expect(page).to have_current_path(add_food_path)
  end

  it 'should be able to see save food' do
    visit '/add_food'
    fill_in 'name', with: 'Pizza'
    fill_in 'measurement_unit', with: '300'
    fill_in 'price', with: '10'
    fill_in 'quantity', with: '20'
    click_button 'Add Food'
    visit '/foods'
    expect(page).to have_content('Pizza')
  end
end
