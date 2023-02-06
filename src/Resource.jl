module Resource

using HTTP, JSON3
using ..Model, ..Service

const ROUTER = HTTP.Router()

createApp(req) = Service.createApp(JSON3.read(req.body))::App
HTTP.register!(ROUTER, "POST", "/app", createApp)

getApp(req) = Service.getApp(JSON3.read(req.body))::App
HTTP.register!(ROUTER, "GET", "/app/*", getApp)

updateApp(req) = Service.updateApp(parse(Int, HTTP.URIs.splitpath(req.target)[2]), JSON3.read(req.body, App))::App
HTTP.register!(ROUTER, "PUT", "/app/*", updateApp)

deleteApp(req) = Service.deleteApp(parse(Int, HTTP.URIs.splitpath(req.target)[2]))
HTTP.register!(ROUTER, "DELETE", "/app/*", deleteApp)

pickAppToWorkOn(req) = Service.pickAppToWorkOn()::App
HTTP.register!(ROUTER, "GET", "/", pickAppToWorkOn)

end # module