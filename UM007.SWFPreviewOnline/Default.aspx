<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UM007.SWFPreviewOnline._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="Resource/CSS/uploadify.css" rel="stylesheet" />
    <script type="text/javascript" src="Resource/JS/jquery.js"></script>
    <script type="text/javascript" src="Resource/JS/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="Resource/JS/swfobject.js"></script>
    <script type="text/javascript" src="Resource/JS/Default.js"></script>
</head>
<body>
    <div id="uploadfileQueue" style="padding: 3px;"></div>
    <div id="file_upload"></div>
    <div>
        <input type="button" value="文件上传" id="FileUpload" />
        <input type="button" value="PDF转SWF" id="PDFFileTranslate" />
    </div>
</body>
</html>
