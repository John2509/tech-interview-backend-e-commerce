# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :routing do
  describe 'routes' do
    it 'routes to #show' do
      expect(get: '/cart').to route_to('carts#show')
    end

    it 'routes to #create via POST' do
      expect(post: '/cart').to route_to('carts#create')
    end

    it 'routes to #add_item via POST' do
      expect(post: '/cart/add_item').to route_to('carts#add_item')
    end

    it 'routes to #destroy_item via DELETE' do
      expect(delete: '/cart/1').to route_to('carts#destroy_item', product_id: '1')
    end
  end
end
