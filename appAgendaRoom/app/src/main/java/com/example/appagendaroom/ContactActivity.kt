package com.example.appagendaroom

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import com.google.gson.Gson
import kotlinx.android.synthetic.main.activity_contact.*

class ContactActivity : AppCompatActivity() {
    lateinit var contact: Contact

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_contact)

        loadContact()
    }

    private fun loadContact() {
        val gson = Gson()
        val stringObj = intent.getStringExtra("contact")

        contact = gson.fromJson(stringObj, Contact::class.java) ?: Contact(null, "", "")

        if (contact.id != null)
        {
            etName.setText(contact.name)
            etTelephone.setText(contact.telephone)
        }
    }

    fun saveContact()
    {
        contact.name = etName.text.toString()
        contact.telephone = etTelephone.text.toString()

        if (contact.id != null)
        {
            AppDataBase.getInstance(this).getDao().updateContact(contact)
        }
        else
        {
            AppDataBase.getInstance(this).getDao().insertContact(contact)
        }
        finish()
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