require 'rails_helper'

RSpec.describe 'Log In page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', email: 'tom@gmail.com', password: 'asdasd')
    @user.save
    visit '/users/sign_in'
  end

  it 'I can see the input in login page' do
    visit '/users/sign_in'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_button 'Log in'
  end

  it 'should be able to see food route' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit root_path
    expect(page).to have_content('Foods')
  end

  it "shouldn't be able to enter to root route" do
    fill_in 'Email', with: 'wrongemail@gmail.com'
    fill_in 'Password', with: 'asdasd'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
