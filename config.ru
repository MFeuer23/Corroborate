require './config/environment'



use Rack::MethodOverride
use UserController
use ClaimController
run ApplicationController
