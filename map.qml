import QtQuick 2.15
import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.15

Rectangle {


    id:window

    property double lattitude: 41.102
    property double longitude: 29.019

    property Component locationmarker: locmarker

    Plugin{

        id:googlemapview
        name:"osm"
    }
    Map{

        activeMapType: supportedMapTypes[1]

        id:mapview
        anchors.fill: parent
        plugin:googlemapview
        center:QtPositioning.coordinate(lattitude,longitude)
        zoomLevel: 11
        color: blue
    }


    Timer {
            id: updateTimer
            interval: 1000 // Update every 1000 milliseconds (1 second)
            repeat: true
            running: true

            onTriggered: {
                // Simulate changing latitude and longitude
                    setCenter(lattitude,longitude)
                    setLocMarker(lattitude,longitude)

            }
    }
    function setCenter(lati, longi)
      {

        mapview.pan(lattitude - lati, longitude - longi)
        lattitude = lati
        longitude = longi
    }
    function setLocMarker(lati, longi)
      {
        var item = locmarker.createObject(window,{
                                          coordinate:QtPositioning.coordinate(lati,longi)
                                          })
        mapview.addMapItem(item)
    }
    Component{
    id:locmarker
    MapQuickItem{

    id:markering
    anchorPoint.x: image.width/4
    anchorPoint.y: image.height
    coordinate: position
    sourceItem: Image {
        id:image
        width:40
        height:40
        source: "qrc:/uuuy.png"
    }

    }

    }


}
