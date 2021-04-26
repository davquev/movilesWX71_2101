package com.example.appmysharepref

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val sharedPreference = SharedPreference(this)

        btSave.setOnClickListener {
            val name = etName.text.toString()
            sharedPreference.save("name", name)
            Toast.makeText(this, "Usuario registrado", Toast.LENGTH_LONG).show()
        }

        btRetrieve.setOnClickListener {
            if (sharedPreference.getValue("name") != null)
            {
                tvRetrieve.setText(sharedPreference.getValue("name"))
                Toast.makeText(this, "Información recuperada", Toast.LENGTH_LONG).show()
            }
        }
    }
}