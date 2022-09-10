require 'rails_helper'

RSpec.describe FoodController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/foods').to route_to('food#index')
    end

    it 'routes to #create' do
      expect(post: '/create_food').to route_to('food#create')
    end

    it 'routes to #delete' do
      expect(delete: '/delete_food/1').to route_to('food#delete', id: '1')
    end
  end
end
