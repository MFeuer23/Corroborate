require './config/environment'



use Rack::MethodOverride
use UserController
use ClaimController
use SubjectController
run ApplicationController
