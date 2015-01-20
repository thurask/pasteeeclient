/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.system 1.2

Page {
    titleBar: TitleBar {
        title: qsTr("Paste.ee Uploader") + Retranslate.onLanguageChanged
    }
    ScrollView {
        Container {
            Container {
                Label {
                    text: qsTr("Register @ http://www.paste.ee for an API key") + Retranslate.onLanguageChanged
                    multiline: true
                    content.flags: TextContentFlag.ActiveText
                }
                Label {
                    text: qsTr("API Key") + Retranslate.onLanguageChanged
                }
                TextField {
                    id: field_apikey
                    text: "9de544e192ad027add473014b21ba3ec"
                }
            }
            Container {
                Label {
                    text: qsTr("Description") + Retranslate.onLanguageChanged
                }
                TextField {
                    id: field_desc
                    text: "BlackBerry 10 Paste.ee Test"
                }
            }
            Container {
                Label {
                    text: qsTr("Paste") + Retranslate.onLanguageChanged
                }
                TextArea {
                    id: area_paste
                    text: "I am the very model of a modern Major-General"
                }
            }
            Container {
                topPadding: 10.0
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: qsTr("Upload!") + Retranslate.onLanguageChanged
                    onClicked: {
                        Paster.uploadPaste(field_apikey.text, field_desc.text, area_paste.text)
                        Paster.uploadUrlChanged.connect(uploadtoast.show())
                    }
                }
            }
            Container {
                topPadding: 10.0
                horizontalAlignment: HorizontalAlignment.Center
                TextArea {
                    id: resultlabel
                    text: qsTr("URL") + Retranslate.onLanguageChanged
                    editable: false
                    textStyle.fontSize: FontSize.XLarge
                }
            }
        }
    }
    attachedObjects: [
        SystemToast {
            id: uploadtoast
            body: qsTr("Uploaded!") + Retranslate.onLanguageChanged
            button.enabled: false
            onFinished: {
                resultlabel.text = Paster.getUploadUrl()
            }
        }
    ]
}
