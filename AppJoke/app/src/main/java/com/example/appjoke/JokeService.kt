package com.example.appjoke

import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface JokeService {
    @GET(value = "api")
    fun getJoke(@Query(value = "format") format: String): Call<Joke>
}