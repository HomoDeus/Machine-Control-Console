## Version: $Id$
##
######################################################################
##
### Commentary:
##
######################################################################
##
### Change Log:
##
######################################################################
##
### Code:

TEMPLATE = aux

target.path = $$[QT_INSTALL_QML]/jbQuick/Charts
target.files += QChart.* qmldir

INSTALLS += target

######################################################################
### qchart.js.pro ends here

DISTFILES += \
    QChart.js \
    QChartGallery.js \
    LICENSE.md \
    README.md \
    QChart.qml \
    QChartGallery.qml
