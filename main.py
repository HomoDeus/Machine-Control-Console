
from PyQt5.QtCore import QUrl, QObject, pyqtSlot
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView

class MyClass(QObject):
    @pyqtSlot(str)    # 输入参数为str类型
    def outputString(self, string):
        print(string)

if __name__ == '__main__':
    path = 'UIDesign/qml/QChartGallery.qml'   # 加载的QML文件
    # path = 'UIDesign/qchart.js-master/QChartGallery.qml'
    app = QGuiApplication([])
    view = QQuickView()
    con = MyClass()
    context = view.rootContext()
    context.setContextProperty("title", "MMC Monitor");
    context.setContextProperty("speed",[10,10,10,10,5.6,5.5,4.0,6.5,5.9,9.0,8.1,5.6,5.5,4,6.5,5.9,9.0,8.1,5.6,5.5,4.0,6.5,5.9,9.0,8.1,5.6,5.5,4]);
    view.engine().quit.connect(app.quit)
    view.setSource(QUrl(path))
    view.show()
    app.exec_()