package com.theleftbit.secondaryapp;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Button;

public final class MainActivity extends Activity {
    private static final String MEDIQUO_URL = "https://www.mediquo.com/app";
    private static final String MEDIQUO_PACKAGE = "com.mediquo.main";
    private static final String PLAY_STORE_PACKAGE = "com.android.vending";
    private static final String PLAY_STORE_URL =
            "market://details?id=" + MEDIQUO_PACKAGE;
    private static final String PLAY_STORE_WEB_URL =
            "https://play.google.com/store/apps/details?id=" + MEDIQUO_PACKAGE;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button openMediquoButton = findViewById(R.id.primary_button);
        openMediquoButton.setOnClickListener(view -> openMediquoApp());
    }

    private void openMediquoApp() {
        Uri url = Uri.parse(MEDIQUO_URL);
        Intent appIntent = new Intent(Intent.ACTION_VIEW, url).setPackage(MEDIQUO_PACKAGE);

        try {
            startActivity(appIntent);
        } catch (ActivityNotFoundException exception) {
            openMediquoStore();
        }
    }

    private void openMediquoStore() {
        Intent playStoreIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(PLAY_STORE_URL))
                .setPackage(PLAY_STORE_PACKAGE);

        try {
            startActivity(playStoreIntent);
        } catch (ActivityNotFoundException exception) {
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(PLAY_STORE_WEB_URL)));
        }
    }
}
