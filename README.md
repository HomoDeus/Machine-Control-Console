# MachineControlConsole
2017年02月11日：Machine Control Console
依赖项：PyQt5，Python3.
安装方法：sudo apt-get install Python3-PyQt5

Currently, This Project denpend on 
目前的PyQt5所采用的Qt版本为（Desktop:5.2;Raspberry Pi:5.3）。这一版本，以及对应的PyQt没有Charm和Data Visualization的功能。升级又太麻烦。
这一点有待今后去研究：
1.如何在树莓派安装Qt5.8，PyQt 5.7。
2.如何搭建树莓派的交叉编译环境。
目前采用的办法是：在Github上找到了一个qchart.js的Project。这个采用Qt5.0做了一个QML。这就可以用于绘制Chart了。
DONE BUild a QML UI that can visualize data.
TODO Design the UI
TODO Let the UI runs more smoothly

## related package install
sudo apt-get install qt5-default
sudo apt-get install qt5*
sudo apt-get install python-pyqt5*
sudo apt-get install python3-pyqt5*
