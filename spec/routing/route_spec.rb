require 'spec_helper'

describe 'routes' do
  routes { FortitudeRails::Engine.routes }

  it 'routes index to docs' do
    expect(get: '/').to route_to(action: 'docs', controller: 'fortitude_rails/static')
  end

  it 'routes to docs' do
    expect(get: '/docs').to route_to(action: 'docs', controller: 'fortitude_rails/static')
  end

  it 'routes to customization' do
    expect(get: '/customization').to route_to(action: 'customization', controller: 'fortitude_rails/static')
  end

  it 'routes to getting started' do
    expect(get: '/getting_started').to route_to(action: 'getting_started', controller: 'fortitude_rails/static')
  end

end