@attached(member, names: named(reuseIdentifier))
public macro ReuseIdentifier() = #externalMacro(
    module: "ReuseIdentifiableMacros",
    type: "ReuseIdentifiableMacro"
)
