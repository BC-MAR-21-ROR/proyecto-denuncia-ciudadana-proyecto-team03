require 'rails_helper'

RSpec.describe AdminpanelController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/adminpanel').to route_to('adminpanel#index')
    end

    it 'routes to #new' do
      expect(get: '/adminpanel/new').to route_to('adminpanel#new')
    end

    it 'routes to #show' do
      expect(get: '/adminpanel/1').to route_to('adminpanel#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/adminpanel/1/edit').to route_to('adminpanel#edit', id: '1')
    end


    it 'routes to #create' do
      expect(post: '/adminpanel').to route_to('adminpanel#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/adminpanel/1').to route_to('adminpanel#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/adminpanel/1').to route_to('adminpanel#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/adminpanel/1').to route_to('adminpanel#destroy', id: '1')
    end
  end
end
