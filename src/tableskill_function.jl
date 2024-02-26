#== ABOUT --------------------------------------------------------------------------------------------------------------

    FUNCTION: tableskill
    AUTHOR: Walter Levy
    DATE: 2024-02-26

    DESCRIPTION ----------------------------------------------------------------------------------------------------

        Export DataFrames to csv files, suitable for viewing in TableSKILL.

    INPUT ----------------------------------------------------------------------------------------------------------

        tableskill(
            ;
          * dataframe_dict::Dict{String, DataFrame} = Dict("dataframe_name" => DataFrame()),
            sub_folder_in_export::String = "",
            root_folder::String = "/temp/tableskill_demo"
        )

          * = mandatory


        ------------------------------------------------------------------------------------------------------------

    OUTPUT ---------------------------------------------------------------------------------------------------------

        csv files of dataframes in dataframe_dict in desired folder

### DEPENDENCIES -----------------------------------------------------------------------------------------------------=#

    using CSV
    using DataFrames
    using Dates

### GLOBAL CONSTANT -----------------------------------------------------------------------------------------------------------
    today_yyyymmdd = Dates.format(Dates.today(), "yyyymmdd")

### FUNCTION -----------------------------------------------------------------------------------------------------------

"""
    tableskill(
        ;
        dataframe_dict::Dict{String, DataFrame} = Dict("dataframe_name" => DataFrame()),
        sub_folder_in_export::String = "",
        root_folder::String = normpath(
            homedir() * "/" * ENV["JULIA_USER_SURNAME"] *"/temp/tableskill/" * Dates.format(Dates.today(), "yyyymmdd")
        )
    )

Export a dictionary of (str => DataFrame) for visualization in TableSKILL.

# Examples:
```julia-repl
julia> tableskill(
    dataframe_dict = Dict(
        "1 security" => security_df,
        "2 portfolio" => portfolio_df,
    ),
    sub_folder_in_export = "portfolio",
)
```
"""
function tableskill(
    ;
    dataframe_dict::Dict{String, DataFrame} = Dict("dataframe_name" => DataFrame()),
    sub_folder_in_export::String = "",
    #root_folder::String = "C:/Users/B046326/Levy/temp/tableskill/" * Dates.format(Dates.today(), "yyyymmdd")
    #root_folder::String = homedir() * "/Levy/temp/tableskill/" * Dates.format(Dates.today(), "yyyymmdd")
    root_folder::String = normpath(
        homedir() * "/" * ENV["JULIA_USER_SURNAME"] *"/temp/tableskill/" * Dates.format(Dates.today(), "yyyymmdd")
    )
)

    #println("root_folder = $(root_folder)")

### SET CONSTANTS ------------------------------------------------------------------------------------------------------
    export_folder = joinpath(root_folder, sub_folder_in_export)

### EXPORT DATA TO CSV -------------------------------------------------------------------------------------------------
    # Create folder if it does not already exist
    mkpath(export_folder)
    # Loop through dataframe_dict and export data to csv using the key value of the dict as csv filename
    for (key, value) in dataframe_dict
        export_filename = key
        export_filename_suffix = ".csv"
        export_filepath = normpath(export_folder, export_filename * export_filename_suffix)
        CSV.write(export_filepath, value; delim=',')
    end

### RETURN VALUE -------------------------------------------------------------------------------------------------------
    return nothing

end

#== TEST ---------------------------------------------------------------------------------------------------------------

    # Create sample input
    isin_vec = [
        "CH0012410517",
        "DE0007664005",
        "DE0007664039",
    ]

    security_df = DataFrame(isin = isin_vec)

    test_call = tableskill(
        dataframe_dict = Dict("security" => security_df),
    )

    test_call2 = tableskill(
        dataframe_dict = Dict("security" => security_df),
        sub_folder_in_export = "test_folder2",
        root_folder = "C:/Users/B046326/Levy/temp"
    )

    #=
    test_call3 = tableskill(
        dataframe_name_vec = [
            "security_df",
        ]
    )
    =#

### ------------------------------------------------------------------------------------------------------------------=#

