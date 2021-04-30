package com.example.appagendaroom

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import kotlinx.android.synthetic.main.activity_contact.*

class ContactActivity : AppCompatActivity() {
    lateinit var contact: Contact

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_contact)
    }

    fun saveContact()
    {
        contact.name = etName.text.toString()
        contact.telephone = etTelephone.text.toString()

        if (contact.id != null)
        {
            AppDataBase.getInstance(this).getDao().updateContact()
        }
        else
        {
            AppDataBase.getInstance(this).getDao().insertContact(contact)
        }
        finish()

        //val name = etName.text.toString()
        //val telephone = etTelephone.text.toString()



        //contact = Contact(null, name, telephone)

        //
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater: MenuInflater = menuInflater
        inflater.inflate(R.menu.contact_menu, menu)

        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when(item.itemId){
            R.id.itemSave ->{
                saveContact()
                true
            }

            R.id.item_delete ->{
                deleteContact()
                true
            }

            else -> super.onOptionsItemSelected(item)
        }
    }

    private fun deleteContact() {
        AppDataBase.getInstance(this).getDao().deleteContact(contact)
        finish()
    }
}