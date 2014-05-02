import QtQuick 2.1
import QtQuick.Window 2.1
import VPlay.plugins.chartboost 1.0

Window {
  visible: true
  width: 360
  height: 360
  // Chartboost config values
  property string iosAppId: "53609edd89b0bb726b46c6e0"
  property string iosAppSignature: "6fed94ffeaf6abb3d5aa85781e59fa2fb83354b8"
  property string androidAppId: "53609f3789b0bb72b4b95836"
  property string androidAppSignature: "c87b4e51a85b76a4bbe41ee880634fc9ae875ca8"

  Chartboost {
    id: chartboost

    licenseKey: "1802219D9DB5B476BA12870EB3692921CF8F51009303CD091C54CAE8FB7526677E5F7F23036FE80846B992824FC2DFFEAA50A62B2B4447FE4A5D9CF784D8FFDFE768ADA878E5DFDD878EC58C8F0DED2F6E60C8E93DA0087962C9E075E79070D544789D30B8035E7EC855A2008A6DFB81922C1DE311ECC942B9D5C7162B54AA37ADD483FC1D84D43E21CF1C83D312086CD0B0B762BB5A9E491075A990784D01D5"

    appId: Qt.platform.os === "ios" ? iosAppId : androidAppId
    appSignature: Qt.platform.os === "ios" ? iosAppSignature : androidAppSignature

    // Use interstitial ads
    shouldRequestInterstitial: true
    shouldDisplayInterstitial: true
    // Only set for testing purposes
    shouldRequestInterstitialsInFirstSession: true

    // Do not use cross-promotion of games
    shouldRequestMoreApps: false
    shouldDisplayLoadingViewForMoreApps: false
    shouldDisplayMoreApps: false

    onInterstitialLoaded: {
      console.debug("Interstitial Loaded")
    }

    onInterstitialFailedToLoad: {
      console.debug("Failed To Load Interstitial")
    }

    // Pre-load an interstitial ad
    Component.onCompleted: chartboost.loadInterstitial()
  }

  // Open an interstitial by clicking anywhere on the Screen
  Text {
    text: qsTr("Open Interstitial Ad")
    anchors.centerIn: parent
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      chartboost.showInterstitial()
    }
  }

}
