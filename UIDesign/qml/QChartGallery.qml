/* QChartGallery.qml --- 
 * 
 * Author: Julien Wintz
 * Created: Thu Feb 13 23:41:59 2014 (+0100)
 * Version: 
 * Last-Updated: Fri Feb 14 12:58:42 2014 (+0100)
 *           By: Julien Wintz
 *     Update #: 5
 */

/* Change Log:
 * 
 */

import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import "."
import "QChart.js"        as Charts
import "QChartGallery.js" as ChartsData

Rectangle {
    function updateCanvas(){
        canvas.requestPaint()
    }
  property int target_length: 400;
  property int plot_height: 210;
  property int plot_width: 440;
  property int text_height: 80;
  property int row_height: 8;
  property int button_height: 10
  property real dotradius:5
  property real linewidth: 5
  color: "#ffffff";
  width: 480//2*row_height + target_length;
  height: 800//5*row_height + text_height + target_length + button_height + plot_height;
// /////////////////////////////////////////////////////////////////
// Header
// /////////////////////////////////////////////////////////////////

  Rectangle { color: "#282b36"; width: parent.width/1.0; height: row_height; }
  Rectangle { color: "#f33e6f"; width: parent.width/3.0; height: row_height; x: 0*width; y: height; }
  Rectangle { color: "#46bfbd"; width: parent.width/3.0; height: row_height; x: 1*width; y: height; }
  Rectangle { color: "#fbd45c"; width: parent.width/3.0; height: row_height; x: 2*width; y: height; }

  Text {

    y: 2*row_height;

    width: parent.width;
    height: text_height;

    text: title//setting in python.
    font.pointSize: 32;

    horizontalAlignment: Text.AlignHCenter;
    verticalAlignment: Text.AlignVCenter;
  }

// /////////////////////////////////////////////////////////////////
// Body
// /////////////////////////////////////////////////////////////////
  Grid {

    id: layout;

    x: row_height;
    y: 2*row_height + text_height;

    width: parent.width;
    height: parent.height - 2*row_height - text_height;

    columns: 1;
    spacing: row_height;
    Chart {
      id: chart_polar;
      width: target_length;
      height: target_length;
      chartAnimated: false;
      chartAnimationEasing: Easing.InBounce;
      chartAnimationDuration: 2000;
      chartData: ChartsData.ChartPolarData;
      chartType: Charts.ChartType.POLAR;
      Item {
        id: arrow
        rotation: 0
        height: target_length
        width: target_length
        Canvas {
          id: canvas
          anchors.centerIn: parent
          height: parent.height
          width: parent.width
          antialiasing: true
          onPaint: {
              var ctx = canvas.getContext('2d')
              ctx.reset()
              ctx.strokeStyle = "#ff0000"
              ctx.lineWidth = 3
              ctx.beginPath()
              ctx.moveTo(parent.height/2,parent.width/2)
              ctx.lineTo(parent.height/2+target_x, parent.height/2+target_y)
              ctx.stroke()
          }
          Rectangle{
            x:parent.height/2+target_x-dotradius
            y:parent.height/2+target_y-dotradius
            height: dotradius*2
            width:  dotradius*2
            radius: dotradius
            color:"#ff0000"
          }

      }
    }
    }
    Grid {
      id: layoutSlider;
      columns: 2;
      Slider {
          id: slider1
          maximumValue: 50
          minimumValue: 0
          anchors.margins: 20
          style: touchStyle
          value: 0.5
      }
      Slider {
          id: slider2
          maximumValue: 100
          minimumValue: 50
          anchors.margins: 20
          style: touchStyle
          value: 0.5
      }
      Text {
        width: 20
        height: 20;
        text: slider1.value.toFixed(2);
        font.pointSize:20;

        horizontalAlignment: Text.AlignLeft;
        verticalAlignment: Text.AlignVCenter;
      }
      Text {
        width: 20;
        height: 20;
        text: slider2.value.toFixed(2);
        font.pointSize: 20;
        horizontalAlignment: Text.AlignLeft;
        verticalAlignment: Text.AlignVCenter;
      }
    }
    Component {
        id: touchStyle
        SliderStyle {
            handle: Rectangle {
                width: 30
                height: 30
                radius: height
                antialiasing: true
                color: Qt.lighter("#468bb7", 1.2)
            }
            groove: Item {
                implicitHeight: 50
                implicitWidth: 200
                Rectangle {
                    height: 8
                    width: parent.width
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#444"
                    opacity: 0.8
                    Rectangle {
                        antialiasing: true
                        radius: 1
                        color: "#468bb7"
                        height: parent.height
                        width: parent.width * control.value / control.maximumValue
                    }
                }
            }
        }
    }
    Chart {
      id: chart_line2;
      width: plot_width;
      height: plot_height;
      chartAnimated: false;
      chartAnimationEasing: Easing.InOutElastic;
      chartAnimationDuration: 2000;
      chartData: ChartsData.ChartLineData;
      chartType: Charts.ChartType.LINE;
    }

  }
}
