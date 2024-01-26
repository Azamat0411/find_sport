package com.mobiledev.find_sport;

import android.app.Application;

import com.yandex.mapkit.MapKitFactory;

public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        MapKitFactory.setLocale("uz_UZ");
        MapKitFactory.setApiKey("69b96881-16a6-410d-8fbc-a04be1461ef");
    }
}
