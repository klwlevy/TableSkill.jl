using Documenter
using TableSkill

makedocs(
    sitename = "TableSkill",
    format = Documenter.HTML(),
    modules = [TableSkill],
    remotes = nothing,
    #repo = Documenter.Remotes.GitHub("klwlevy", "TableSkill"),
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=
    deploydocs(
        repo = "github.com/klwlevy/TableSkill.git"
    )
=#
