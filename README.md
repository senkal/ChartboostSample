Qt 5 Chartboost Sample
======================

This sample demonstrates how to use the Chartboost SDK (Android 5.4.1 & iOS 5.4.0) within a Qt 5 app or game with the help of [V-Play's Qt 5 Chartboost Plugin](http://plugins.v-play.net/plugins/chartboost/) (1.1).

Usage
-----

- Download the sample and rename the extracted folder from `ChartboostSample-master` to `ChartboostSample`

- Install the Chartboost plugin as described here: http://plugins.v-play.net/doc/plugin-installation/#downloading-v-play-plugins

- Open `ChartboostSample.pro` in Qt Creator and configure the project for an iOS or Android target

- Make sure that the [Gradle build system](http://plugins.v-play.net/doc/android-gradle/#enable-gradle-build-system) for Android is enabled

- Optionally, open the `main.qml` file and replace the `appId` and `appSignature` properties with your own ids. If you do not have an Chartboost account yet, you can create a new one at http://www.chartboost.com/.


Please also have a look at http://plugins.v-play.net/doc/vplay-plugins-chartboost/ to learn how to integrate the plugin into your own Qt 5 app.
