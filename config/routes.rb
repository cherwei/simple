ActionController::Routing::Routes.draw do |map|
  map.root :controller => :bookings, :action => :index
  map.resources :bookings
end
