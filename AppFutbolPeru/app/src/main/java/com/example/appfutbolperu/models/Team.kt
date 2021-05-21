package com.example.appfutbolperu.models

import com.google.gson.annotations.SerializedName
import java.io.Serializable

class Team (
    @SerializedName("team_id")
    var team_id: Int,
    @SerializedName("name")
    var name: String,
    @SerializedName("logo")
    var logo: String,
    @SerializedName("venue_name")
    var venue_name: String
        ): Serializable
