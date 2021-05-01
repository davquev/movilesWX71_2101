package com.example.appagendaroom

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

@Database(entities = arrayOf(Contact::class), version = 1)
abstract class AppDataBase: RoomDatabase() {
    abstract fun getDao() : ContactDAO

    companion object{
        private var INSTANCE: AppDataBase? = null

        fun getInstance(context: Context): AppDataBase{
            if (INSTANCE == null){
                INSTANCE = Room
                    .databaseBuilder(context, AppDataBase::class.java, "appv2.db")
                    .allowMainThreadQueries()
                    .build()
            }
            return INSTANCE as AppDataBase
        }
    }
}