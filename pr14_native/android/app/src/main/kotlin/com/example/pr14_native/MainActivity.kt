package com.example.pr14_native

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class MainActivity : FlutterActivity() {
    // назва каналу має збігатися з назвою у Dart-коді
    private val channelName = "com.example.pr14_native/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                if (call.method == "getCurrentTime") {
                    // поточний час у форматі HH:MM:SS
                    val time = SimpleDateFormat("HH:mm:ss", Locale.US).format(Date())
                    result.success(time)
                } else {
                    result.notImplemented()
                }
            }
    }
}
