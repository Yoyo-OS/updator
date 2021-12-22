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

    signal checkFinish()

    ColumnLayout {
        anchors.fill: parent
        spacing: FishUI.Units.largeSpacing * 2

        Item {
            Layout.fillHeight: true
        }

        FishUI.BusyIndicator {
            width: 64
            height: 64
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Checking for updates...")
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: updator.checkProgress + "%"
            Layout.alignment: Qt.AlignHCenter
            color: FishUI.Theme.disabledTextColor
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
