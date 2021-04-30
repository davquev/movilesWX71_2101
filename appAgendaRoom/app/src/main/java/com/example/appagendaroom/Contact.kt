package com.example.appagendaroom

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
data class Contact (
    @PrimaryKey(autoGenerate = true)
    var id: Int?,

    @ColumnInfo
    var name: String,

    @ColumnInfo
    var telephone: String
        )