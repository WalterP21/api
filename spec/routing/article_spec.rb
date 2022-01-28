require 'rails_helper'

RSpec.describe '/articles routes' do
  it 'routes to article#index' do
    #expect(get '/articles').to route_to(controller: 'articles', action: 'indec')
    expect(get '/articles').to route_to('articles#index')
  end
end