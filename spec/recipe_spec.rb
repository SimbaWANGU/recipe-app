require 'rails_helper'

RSpec.describe 'Recipe page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Jerry', email: 'jerry@gmail.com', password: 'asdasd')
    @user1.save
    @user2 = User.new(name: 'Kero', email: 'kero@gmail.com', password: 'asdasd')
    @user2.save!
    @recipe1 = Recipe.new(name: 'Pizza', preparation_time: 30, cooking_time: 60, description: 'A delicious pizza',
                          public: true, user_id: @user1.id)

    @recipe1.save!
    visit '/users/sign_in'
    fill_in 'Email', with: 'jerry@gmail.com'
    fill_in 'Password', with: 'asdasd'
    click_button 'Log in'
  end

  it 'should be able to see Recipes' do
    visit '/recipes'
    expect(page).to have_content('Recipes')
  end

  it 'should be able to redirect to add recipe route' do
    visit '/recipes'
    click_link 'New Recipe'
    expect(page).to have_current_path(recipes_new_path)
  end

  it 'should be able to see save recipe' do
    visit '/recipes/new'
    fill_in 'Name', with: 'Pizza'
    fill_in 'Preparation time', with: '30'
    fill_in 'Cooking time', with: '60'
    fill_in 'Description', with: 'A delicious pizza'
    click_button 'Add Recipe'
    visit '/recipes'
    expect(page).to have_content('Pizza')
  end
end
