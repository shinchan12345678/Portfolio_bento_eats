class Owner::ApplicationController < ApplicationController
  before_action :authenticate_owner!

end
