/*
 * PasteClient.hpp
 *
 *  Created on: Jan 19, 2015
 *      Author: Thurask
 */

#ifndef PASTECLIENT_HPP_
#define PASTECLIENT_HPP_

#include <QtCore>
#include <QtNetwork>

class PasteClient: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uploadUrl WRITE setUploadUrl READ getUploadUrl NOTIFY uploadUrlChanged)

public:
    PasteClient();
    virtual ~PasteClient();

    public Q_SLOTS:
    Q_INVOKABLE
    void uploadPaste(QString key, QString description, QString paste);

    void setUploadUrl(QString paste);

    Q_INVOKABLE
    QString getUploadUrl();

    Q_SIGNALS:
    void uploadUrlChanged();

    private Q_SLOTS:
    void pasteReply();

private:
    QString uploadUrl;
};

#endif /* PASTECLIENT_HPP_ */
