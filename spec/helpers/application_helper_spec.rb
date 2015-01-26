require 'spec_helper'

describe FortitudeRails::ApplicationHelper do

  it 'returns theme intents' do
    expect(helper.theme_intents).to eq(FortitudeRails.theme_intents)
  end

  it 'returns theme components' do
    expect(helper.theme_components).to eq(FortitudeRails.theme_components)
  end

  it 'renders escaped html' do
    expect(helper.escaped('fortitude_rails/components/app_specific')).to eq('&lt;h1&gt;App Specific&lt;/h1&gt;')
  end

  it 'renders nav tree' do
    components = {components: {'_box.html.haml' => 'file'}}
    rendered = <<-HTML
    <li><a href='#components' class='list-navigation__link'>Components</a><ul class="bare-list bare-list--dotted-line"><li><a href='#box' class='list-navigation__link'>Box</a></li></ul></li>
    HTML
    expect(helper.render_nav_tree(components)).to eq(rendered.strip)
  end

  it 'renders component tree' do
    components = {components: {'_box.html.haml' => 'file'}}
    rendered = <<-HTML
    <div class='layout xs-mtb2 xs-mr2' id='box'>#{render partial: 'fortitude_rails/components/box'}</div>
    HTML
    expect(helper.render_component_tree(components)).to eq(rendered.strip)
  end

end