class ApplicationController < ActionController::Base
  include Clearance::Controller
  include SetCurrentRequestDetails

  layout "public"
end
