```@meta
CurrentModule = TableSkill
```

# TableSkill

Documentation for [TableSkill.jl](https://github.com/klwlevy/TableSkill.jl).

```@autodocs
Modules = [TableSkill]
```

```@raw html
<details closed><summary>Example:</summary>
```

```@example detail_example
using TableSkill, DataFrames, RDatasets, Chain

movies_df = RDatasets.dataset("ggplot2", "movies")

curated_movies_df = @chain movies_df begin
    # Select only some variables
    curated_movies_df1 = select(
        :Title, :Rating, :Votes,
        :Action, :Animation, :Comedy, :Short
    )

    # Select only some rows
    curated_movies_df2 = subset(
        [:Votes] => ByRow(>=(1000)),
        [:Action, :Animation, :Comedy] => ByRow((a,b,c) -> a+b+c >= 1)
    )

    # Sort
    curated_movies_df3 = sort(
        [
            order(:Rating, rev = true),
            order(:Votes, rev = true),
        ]
    )
end

withenv("JULIA_USER_SURNAME"=>"levy") do
    tableskill(
        dataframe_dict = Dict(
            "1 movies_df" => movies_df,
            "2a curated_movies_df1" => curated_movies_df1,
            "2b curated_movies_df2" => curated_movies_df2,
            "2c curated_movies_df3" => curated_movies_df3,
            "3 curated_movies_df" => curated_movies_df
        ),
        sub_folder_in_export = "tableskill_example",
    )
end

nothing #hide
```

```@raw html
</details>
```

![Example usage](figures/screen_video.mp4)
