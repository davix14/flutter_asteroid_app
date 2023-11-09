package com.example.asteroid_test_app

import android.content.ContentValues
import android.os.ParcelFileDescriptor
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel



class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.asteroidApp.dev/save"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // This method is invoked on the main thread.
            call, result ->
            if (call.method == "saveFile") {
                try {
                    val context = applicationContext

                    val fileName: String = call.argument("fileName")!!
                    val mimeType: String = call.argument("mimeType")!!
                    val bytes: ByteArray = call.argument("bytes")!!

                    val values = ContentValues().apply {
                        put(MediaStore.Downloads.DISPLAY_NAME, fileName)
                        put(MediaStore.Downloads.MIME_TYPE, mimeType)
                        put(MediaStore.Downloads.IS_PENDING, 1)
                    }

                    val resolver = context.contentResolver

                    val collection =
                        MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)

                    val itemUri = resolver.insert(collection, values)

                    if (itemUri != null) {

                        resolver.openFileDescriptor(itemUri, "w").use {
                            ParcelFileDescriptor.AutoCloseOutputStream(it).write(bytes)
                        }

                        values.clear()
                        values.put(MediaStore.Downloads.IS_PENDING, 0)
                        resolver.update(itemUri, values, null, null)
                        result.success("success!")
                    }
                } catch (e: Exception) {
                    result.error("UNAVAILABLE", "Error writing the file.", e)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
