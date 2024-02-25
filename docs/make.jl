using TableSkill
using Documenter

DocMeta.setdocmeta!(TableSkill, :DocTestSetup, :(using TableSkill); recursive=true)

makedocs(;
    modules=[TableSkill],
    authors="Walter Levy <klwlevy@hotmail.com> and contributors",
    sitename="TableSkill.jl",
    format=Documenter.HTML(;
        canonical="https://klwlevy.github.io/TableSkill.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

#=
deploydocs(;
    repo="github.com/klwlevy/TableSkill.jl",
    devbranch="master",
)
=#