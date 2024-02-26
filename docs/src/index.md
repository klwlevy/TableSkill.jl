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
using TableSkill, DataFrames

my_df1 = DataFrame(x = 42, y = 1:10, z = "hello")
my_df2 = DataFrame(x = 42, y = 1:10, z = "world")

tableskill(
    dataframe_dict = Dict(
        "1 my_df1" => my_df1,
        "2 my_df2" => my_df2,
    ),
    sub_folder_in_export = "my_folder",
)

nothing #hide
```

```@raw html
</details>
```