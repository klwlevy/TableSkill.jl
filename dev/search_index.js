var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = TableSkill","category":"page"},{"location":"#TableSkill","page":"Home","title":"TableSkill","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for TableSkill.jl.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [TableSkill]","category":"page"},{"location":"#TableSkill.tableskill-Tuple{}","page":"Home","title":"TableSkill.tableskill","text":"tableskill(\n    ;\n    dataframe_dict::Dict{String, DataFrame} = Dict(\"dataframe_name\" => DataFrame()),\n    sub_folder_in_export::String = \"\",\n    root_folder::String = normpath(\n        homedir() * \"/\" * ENV[\"JULIA_USER_SURNAME\"] *\"/temp/tableskill/\" * Dates.format(Dates.today(), \"yyyymmdd\")\n    )\n)\n\nExport a dictionary of (str => DataFrame) for visualization in TableSKILL.\n\nExamples:\n\njulia> tableskill(\n    dataframe_dict = Dict(\n        \"1 security\" => security_df,\n        \"2 portfolio\" => portfolio_df,\n    ),\n    sub_folder_in_export = \"portfolio\",\n)\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"<details closed><summary>Example:</summary>","category":"page"},{"location":"","page":"Home","title":"Home","text":"using TableSkill, DataFrames, RDatasets, Chain\n\nmovies_df = RDatasets.dataset(\"ggplot2\", \"movies\")\n\ncurated_movies_df = @chain movies_df begin\n    # Select only some variables\n    curated_movies_df1 = select(\n        :Title, :Rating, :Votes,\n        :Action, :Animation, :Comedy, :Short\n    )\n\n    # Select only some rows\n    curated_movies_df2 = subset(\n        [:Votes] => ByRow(>=(1000)),\n        [:Action, :Animation, :Comedy] => ByRow((a,b,c) -> a+b+c >= 1)\n    )\n\n    # Sort\n    curated_movies_df3 = sort(\n        [\n            order(:Rating, rev = true),\n            order(:Votes, rev = true),\n        ]\n    )\nend\n\nwithenv(\"JULIA_USER_SURNAME\"=>\"levy\") do\n    tableskill(\n        dataframe_dict = Dict(\n            \"1 movies_df\" => movies_df,\n            \"2a curated_movies_df1\" => curated_movies_df1,\n            \"2b curated_movies_df2\" => curated_movies_df2,\n            \"2c curated_movies_df3\" => curated_movies_df3,\n            \"3 curated_movies_df\" => curated_movies_df\n        ),\n        sub_folder_in_export = \"tableskill_example\",\n    )\nend\n\nnothing #hide","category":"page"},{"location":"","page":"Home","title":"Home","text":"</details>","category":"page"},{"location":"","page":"Home","title":"Home","text":"(Image: Example usage)","category":"page"}]
}
