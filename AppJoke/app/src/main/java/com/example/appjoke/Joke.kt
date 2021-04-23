package com.example.appjoke

import com.google.gson.annotations.SerializedName

class Joke (
    @SerializedName(value = "joke")
    var joke: String
)