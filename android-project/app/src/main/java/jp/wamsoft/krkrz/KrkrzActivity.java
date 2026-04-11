package jp.wamsoft.krkrz;

import android.os.Bundle;

import org.libsdl.app.SDLActivity;

public class KrkrzActivity extends SDLActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setAssetManager(getAssets());
    }

    public native void setAssetManager(Object assetManager);
}
