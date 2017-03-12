
from PyQt5.QtCore import QUrl, QObject, pyqtSlot
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtCore import QTimer

def onTimer():
    global tic
    global px
    global py
    context.setContextProperty("title", "MMC Monitor");
    context.setContextProperty("speed",[10,10,10,10,5.6,5.5,4.0,6.5,5.9,9.0,8.1,5.6,5.5,4,6.5,5.9,9.0,8.1,5.6,5.5,4.0,6.5,5.9,9.0,8.1,5.6,5.5,4]);
    context.setContextProperty("position",
                               [28 / 10, 48 / 10, 40 / 10, 19 / 10, 96 / 10, 27 / 10, 100 / 10, 55 / 10, 40 / 10,
                                65 / 10, 59 / 10, 90 / 10,
                                81 / 10, 56 / 10, 28 / 10, 48 / 10, 40 / 10, 19 / 10, 96 / 10, 27 / 10, 100 / 10,
                                55 / 10, 40 / 10, 65 / 10,
                                59 / 10, 90 / 10, 81 / 10, 56 / 10]);

    context.setContextProperty("target_x",px[tic])
    context.setContextProperty("target_y",py[tic])
    root.updateCanvas()
    if tic<15:
        tic=tic+1
    else:
        tic=0
if __name__ == '__main__':
    global root
    global context
    global px
    global py
    px=[100,50,31,42,12,-50,-53,26,47,-60,-90,76,-165,69,-51,160]
    py = [ 12, -165, 69, -51, 160,100, 50, -50, 26,42, 47, -60, -90, 76, 31,  -53]
    app = QGuiApplication([])
    view = QQuickView()
    context = view.rootContext()
    tic = 0
    path = 'UIDesign/qml/QChartGallery.qml'   # 加载的QML文件
    # path = 'UIDesign/qchart.js-master/QChartGallery.qml'

    context.setContextProperty("title", "MMC Monitor");
    context.setContextProperty("speed",[10,10,10,10,5.6,5.5,4.0,6.5,5.9,9.0,8.1,5.6,5.5,4,6.5,5.9,9.0,8.1,5.6,5.5,4.0,6.5,5.9,9.0,8.1,5.6,5.5,4]);
    context.setContextProperty("position",
                               [28 / 10, 48 / 10, 40 / 10, 19 / 10, 96 / 10, 27 / 10, 100 / 10, 55 / 10, 40 / 10,
                                65 / 10, 59 / 10, 90 / 10,
                                81 / 10, 56 / 10, 28 / 10, 48 / 10, 40 / 10, 19 / 10, 96 / 10, 27 / 10, 100 / 10,
                                55 / 10, 40 / 10, 65 / 10,
                                59 / 10, 90 / 10, 81 / 10, 56 / 10]);

    context.setContextProperty("target_x",100);
    context.setContextProperty("target_y",-100);
    view.engine().quit.connect(app.quit)
    view.setSource(QUrl(path))
    root = view.rootObject()
    view.show()
    timer = QTimer()
    timer.timeout.connect(onTimer)
    timer.start(200)

    app.exec_()