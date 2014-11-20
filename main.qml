import QtQuick 2.3
import QtQuick.Window 2.1
import VPlay.plugins.chartboost 1.1

Window {
  visible: true
  width: 360
  height: 360

  // Chartboost config values from your Chartboost campaigns
  property string iosAppId: "53609edd89b0bb726b46c6e0"
  property string iosAppSignature: "6fed94ffeaf6abb3d5aa85781e59fa2fb83354b8"
  property string androidAppId: "53609f3789b0bb72b4b95836"
  property string androidAppSignature: "c87b4e51a85b76a4bbe41ee880634fc9ae875ca8"

  Chartboost {
    id: chartboost

    licenseKey: "1802219D9DB5B476BA12870EB3692921CF8F51009303CD091C54CAE8FB7526677E5F7F23036FE80846B992824FC2DFFEAA50A62B2B4447FE4A5D9CF784D8FFDF874E7FF02D580785912548C7B7016BA96E60C8E93DA0087962C9E075E79070D544789D30B8035E7EC855A2008A6DFB81922C1DE311ECC942B9D5C7162B54AA37ADD483FC1D84D43E21CF1C83D312086CD0B0B762BB5A9E491075A990784D01D5"

    appId: Qt.platform.os === "ios" ? iosAppId : androidAppId
    appSignature: Qt.platform.os === "ios" ? iosAppSignature : androidAppSignature

    // Only set for testing purposes, not recommended in production-ready games
    // see http://plugins.v-play.net/doc/vplay-plugins-chartboost/#shouldRequestInterstitialsInFirstSession-prop
    shouldRequestInterstitialsInFirstSession: true

    // Set to true as we don't cache the more apps page in this example
    shouldDisplayLoadingViewForMoreApps: true

    // Do not use reward videos
    shouldDisplayRewardedVideo: false

    // Interstitial handlers

    onInterstitialCached: {
      console.debug("InterstitialCached at location:", location)
    }

    onInterstitialDisplayed: {
      console.debug("InterstitialDisplayed at location:", location)
    }

    onInterstitialClicked: {
      console.debug("InterstitialClicked at location:", location)
    }

    onInterstitialDismissed: {
      console.debug("InterstitialDismissed at location:", location)
    }

    onInterstitialClosed: {
      console.debug("InterstitialClosed at location:", location)
    }

    onInterstitialFailedToLoad: {
      console.debug("InterstitialFailedToLoad at location:", location, "error:", error)
    }

    // More apps page handlers

    onMoreAppsCached: {
      console.debug("MoreAppsCached at location:", location)
    }

    onMoreAppsDisplayed: {
      console.debug("MoreAppsDisplayed at location:", location)
    }

    onMoreAppsClicked: {
      console.debug("MoreAppsClicked at location:", location)
    }

    onMoreAppsDismissed: {
      console.debug("MoreAppsDismissed at location:", location)
    }

    onMoreAppsClosed: {
      console.debug("MoreAppsClosed at location:", location)
    }

    onMoreAppsFailedToLoad: {
      console.debug("MoreAppsFailedToLoad at location:", location, "error:", error)
    }
  }


  Column {
    spacing: 40
    anchors.centerIn: parent

    // Open an interstitial ad
    //
    // Note that you should cache an interstitial with cacheInterstitial() before calling
    // showInterstitial() in a production-ready game, otherwise there might be a small
    // delay between calling the method and displaying the ad
    Text {
      text: qsTr("Open Interstitial Ad")

      anchors.verticalCenter: parent.horizontalCenter

      MouseArea {
        anchors.fill: parent
        onClicked: {
          chartboost.showInterstitial()
        }
      }
    }

    // Open a more apps page to cross-promote other games
    //
    // Again make sure to cache the page before calling this method with cacheMoreApps()
    Text {
      text: qsTr("Open More Apps Page")

      anchors.verticalCenter: parent.horizontalCenter

      MouseArea {
        anchors.fill: parent
        onClicked: {
          chartboost.showMoreApps(Chartboost.HomeScreenLocation)
        }
      }
    }
  }
}
