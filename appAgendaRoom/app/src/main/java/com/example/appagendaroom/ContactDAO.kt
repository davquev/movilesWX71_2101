package com.example.appagendaroom

import androidx.room.*

@Dao
interface ContactDAO {
    @Query("SELECT * FROM Contact")
    fun getAll(): List<Contact>

    @Insert
    fun insertContact(vararg contact: Contact)

    @Delete
    fun deleteContact(vararg contact: Contact)

    @Update
    fun updateContact(vararg contact: Contact)
}