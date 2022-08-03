using Sorting
using Documenter

DocMeta.setdocmeta!(Sorting, :DocTestSetup, :(using Sorting); recursive=true)

makedocs(;
    modules=[Sorting],
    authors="Gianfranco Ponza",
    repo="https://github.com/gianeering/Sorting.jl/blob/{commit}{path}#{line}",
    sitename="Sorting.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gianeering.github.io/Sorting.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gianeering/Sorting.jl",
    devbranch="main",
)
