package com.example.geoquiz

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {

    lateinit var questions: ArrayList<Question>
    var position = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadQuestions()
        setupViews()
    }

    fun loadQuestions() {
        questions = ArrayList()
        var question = Question("Es Lima la capital de Perú", true)
        questions.add(question)

        question = Question("Es Lima la capital de Chile", false)
        questions.add(question)

        question = Question("Es Venezuela la capital de Chile", false)
        questions.add(question)

        question = Question("Es Caracas la capital de Venezuela", true)
        questions.add(question)

        question = Question("Es Madrid la capital de Mexico", false)
        questions.add(question)
    }

    fun setupViews() {
        //val btYes = findViewById<Button>(R.id.btYes)

        showSentences()
        btYes.setOnClickListener {
            if (questions[position].answer){
                Toast.makeText(this, "Correcto", Toast.LENGTH_LONG).show()
            }else{
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_LONG).show()
            }
        }

        btNo.setOnClickListener {
            if (!questions[position].answer){
                Toast.makeText(this, "Correcto", Toast.LENGTH_LONG).show()
            }else{
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_LONG).show()
            }
        }

        /*
        btNo.setOnClickListener {
            Toast.makeText(this, "Incorrecto", Toast.LENGTH_LONG).show()
        }
         */

        btNext.setOnClickListener {
            position++
            showSentences()
        }
    }

    fun showSentences() {
        tvSentence.text = questions[position].sentence
    }
}