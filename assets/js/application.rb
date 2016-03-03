require 'opal'
require 'opal-browser'
require 'clearwater'

class Layout
  include Clearwater::Component

  def render
    div 'hello world!!!!!!!'
  end
end

App = Clearwater::Application.new(
  component: Layout.new,
  # router:  router,
  element:   $document['#app'],
)
App.call

