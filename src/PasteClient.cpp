/*
 * PasteClient.cpp
 *
 *  Created on: Jan 19, 2015
 *      Author: Thurask
 */

#include "PasteClient.hpp"

#include <QtCore>
#include <QtNetwork>

PasteClient::PasteClient()
{

}

void PasteClient::uploadPaste(QString key, QString description, QString paste)
{
    QUrl url("https://paste.ee/api");
    url.addEncodedQueryItem("key", QUrl::toPercentEncoding(key));
    url.addEncodedQueryItem("format", QUrl::toPercentEncoding("simple"));
    url.addEncodedQueryItem("paste", QUrl::toPercentEncoding(paste));
    url.addEncodedQueryItem("description", QUrl::toPercentEncoding(description));
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QNetworkAccessManager *http = new QNetworkAccessManager(this);
    QNetworkReply* reply = http->post(request, url.encodedQuery());
    connect(reply, SIGNAL(finished()), this, SLOT(pasteReply()));
}

void PasteClient::pasteReply()
{
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());
    QVariant url = reply->readAll();
    qDebug() << url.toString();
    setUploadUrl(url.toString());
    sender()->deleteLater();
}

void PasteClient::setUploadUrl(QString paste)
{
    uploadUrl = paste;
    emit uploadUrlChanged();
}

QString PasteClient::getUploadUrl()
{
    return uploadUrl;
}

PasteClient::~PasteClient()
{

}

