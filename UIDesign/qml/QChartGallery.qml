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

import "."
import "QChart.js"        as Charts
import "QChartGallery.js" as ChartsData

Rectangle {
  property int target_length: 400;
  property int plot_height: 210;
  property int plot_width: 440;
  property int text_height: 80;
  property int row_height: 8;
  property int button_height: 10
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

    text: "MMC Monitor";
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
    }

    Rectangle {

      id: button;

//      anchors.top:  parent.top;
//      anchors.topMargin: (parent.height-parent.font.pointSize)/2;
//      anchors.right: parent.right;
//      anchors.rightMargin: (parent.height-parent.font.pointSize)/2;

      width: 100;
      height: 32;

      color: "#2d91ea";
      radius: 8;

      Text {
        anchors.centerIn: parent;
        color: "#ffffff";
        text: "Repaint";
        font.bold: true;
      }

      MouseArea {
        anchors.fill: parent;
        onPressed: {
          button.color = "#1785e6"
        }
        onReleased: {
          button.color = "#2d91ea"
          chart_bar.repaint();
          chart_doughnut.repaint();
          chart_line.repaint();
          chart_pie.repaint();
          chart_polar.repaint();
          chart_radar.repaint();
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
