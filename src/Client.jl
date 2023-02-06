module Client

using HTTP, JSON3
using ..Model

const SERVER = Ref{String}("http://localhost:8080")

function createApp(name, user, path)
    body = (; name, user, path)
    resp = HTTP.post(string(SERVER[], "/app"), [], JSON3.write(body))
    return JSON.read(resp.body, App)
end

function getApp(id)
    resp = HTTP.get(string(SERVER[], "/album/$id"))
    return JSON3.read(resp.body, App)
end

function updateApp(app)
    resp = HTTP.put(string(SERVER[], "/app/$(app.id)"), [], JSON3.write(app))
    return JSON3.read(resp.body, App)
end

function deleteApp(id)
    resp = HTTP.delete(string(SERVER[], "/app/$id"))
    return
end

function pickAppToWorkOn()
    resp = HTTP.get(string(SERVER[], "/"))
    return JSON3.read(resp.body, App)
end

end # module