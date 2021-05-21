package com.example.appfutbolperu.models

import com.google.gson.annotations.SerializedName

class ApiResponseDetails (
    @SerializedName("results")
    var results: Int,
    @SerializedName("teams")
    var teams: List<Team>
        )