package com.example.appcamara

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private val CAMERA_REQUEST_CODE=0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btPermiso.setOnClickListener {
            checkCameraPermission()
        }
    }

    private fun checkCameraPermission() {
        if(ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA)
        != PackageManager.PERMISSION_GRANTED)
        {
            //permiso rechazado
            requestCameraPermission()
            //Toast.makeText(this, "permiso rechazado", Toast.LENGTH_LONG).show()
        }
        else
        {
            Toast.makeText(this, "ya se cuenta con permiso a la camara",
                    Toast.LENGTH_LONG).show()
        }
    }

    private fun requestCameraPermission() {
        if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.CAMERA))
        {
            Toast.makeText(this, "Antes rechazó el permiso. Habilítelo manualmente",
                    Toast.LENGTH_LONG).show()
        }
        else
        {
            Toast.makeText(this, "debe aceptar el permiso",
                    Toast.LENGTH_LONG).show()
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CAMERA),CAMERA_REQUEST_CODE)
        }
    }

    //onRequestPermissionsResult
    override fun onRequestPermissionsResult(
            requestCode: Int,
            permissions: Array<String>,
            grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when (requestCode){
            CAMERA_REQUEST_CODE ->{
                if ((grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED))
                {
                    Toast.makeText(this, "se autorizó uso de la camara",
                            Toast.LENGTH_LONG).show()

                    // otra funcionalidad cuando tenga permiso!!
                }
                else
                {
                    Toast.makeText(this, "permiso denegado",
                            Toast.LENGTH_LONG).show()
                }
                return
            }
        }
    }
}