package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new com.github.florent37.assets_audio_player.AssetsAudioPlayerPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin assets_audio_player, com.github.florent37.assets_audio_player.AssetsAudioPlayerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.github.florent37.assets_audio_player_web.AssetsAudioPlayerWebPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin assets_audio_player_web, com.github.florent37.assets_audio_player_web.AssetsAudioPlayerWebPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.ryanheise.audio_session.AudioSessionPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin audio_session, com.ryanheise.audio_session.AudioSessionPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.ryanheise.just_audio.JustAudioPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin just_audio, com.ryanheise.just_audio.JustAudioPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.lucasjosino.on_audio_query.OnAudioQueryPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin on_audio_query, com.lucasjosino.on_audio_query.OnAudioQueryPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin path_provider_android, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin permission_handler_android, com.baseflow.permissionhandler.PermissionHandlerPlugin", e);
    }
  }
}
