/*
 * Copyright (C) 2021 CutefishOS Team.
 *
 * Author:     Kate Leet <kate@cutefishos.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import FishUI 1.0 as FishUI
import Cutefish.Updator 1.0

Item {
    id: control

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.fillHeight: !_listView.visible
        }

        Image {
            Layout.preferredWidth: 167
            Layout.preferredHeight: 26
            sourceSize: Qt.size(500, 76)
            source: "qrc:/images/logo.png"
            Layout.alignment: Qt.AlignHCenter
            asynchronous: true
            visible: !_listView.visible
        }

        Item {
            height: FishUI.Units.largeSpacing * 2
        }

        Label {
            text: "<b>" + qsTr("Package updates are available") + "</b>"
            visible: _listView.count !== 0
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: "<b>" + qsTr("Your system is up to date") + "</b>"
            visible: _listView.count === 0
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Current Version: %1").arg(updator.version)
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillHeight: true
        }

        ListView {
            id: _listView
            model: upgradeableModel

            visible: _listView.count !== 0
            spacing: FishUI.Units.largeSpacing
            clip: true

            ScrollBar.vertical: ScrollBar {}

            Layout.fillWidth: true
            Layout.fillHeight: true

            delegate: Item {
                width: ListView.view.width
                height: 40

                Rectangle {
                    anchors.fill: parent
                    anchors.leftMargin: FishUI.Units.largeSpacing
                    anchors.rightMargin: FishUI.Units.largeSpacing
                    color: FishUI.Theme.secondBackgroundColor
                    radius: FishUI.Theme.mediumRadius
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: FishUI.Units.largeSpacing * 1.5
                    anchors.rightMargin: FishUI.Units.largeSpacing * 1.5
                    spacing: FishUI.Units.smallSpacing

                    Image {
                        height: 32
                        width: 32
                        sourceSize: Qt.size(width, height)
                        source: "image://icontheme/" + model.name
                        smooth: true
                        antialiasing: true
                    }

                    Label {
                        text: model.name
                        Layout.fillWidth: true
                    }

                    Label {
                        text: model.version
                        color: FishUI.Theme.disabledTextColor
                    }
                }
            }
        }

        Item {
            height: FishUI.Units.smallSpacing
        }

        Button {
            text: qsTr("Update now")
            Layout.alignment: Qt.AlignHCenter
            visible: _listView.count !== 0
            flat: true
            onClicked: updator.upgrade()
        }

        Item {
            height: FishUI.Units.largeSpacing
        }
    }
}
