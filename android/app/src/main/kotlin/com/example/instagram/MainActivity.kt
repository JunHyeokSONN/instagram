package com.example.instagram

import android.app.AlarmManager
import android.content.Context
import android.content.Intent
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant



class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "dexterx.dev/flutter_local_notifications_example").setMethodCallHandler(
                MethodChannel.MethodCallHandler { call, result ->
                    when (call.method) {
                        "requestExactAlarmPermission" -> {
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                                val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
                                val hasPermission = alarmManager.canScheduleExactAlarms()
                                if (!hasPermission) {
                                    val intent = Intent("android.app.action.REQUEST_SCHEDULE_EXACT_ALARM").apply {
                                        putExtra("android.app.extra.PACKAGE_NAME", packageName)
                                    }
                                    startActivity(intent)
                                }
                                result.success(hasPermission)
                            } else {
                                result.success(true)
                            }
                        }
                        else -> result.notImplemented()
                    }
                })
    }
}
