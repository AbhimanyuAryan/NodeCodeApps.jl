module Model

import Base: ==

using StructTypes
using Dates

export App

mutable struct App
    id::Int64
    name::String
    # files tree
    created::DateTime
end

==(x::App, y::App) = x.id == y.id
App() = Album(0, "", Dates.now())
App(name, created) = App(0, name, Dates.now())
StructTypes.StructTypes(::Type{App}) = StructTypes.Mutable()

end # module