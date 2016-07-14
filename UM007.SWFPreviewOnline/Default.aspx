<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UM007.SWFPreviewOnline._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.1.intellisense.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            PageInit();
            EventInit();
        });
        function PageInit() {
            $.post('PageInit.ashx', function (data) {
                if (data === '') return;
                var fileNames = data.split(',');
                for (var index in fileNames) {
                    var fileName = fileNames[index];
                    $('#PDFFileTranslate').after('<input type="button" value="' + fileName + '预览"  onclick="FilePreview(\'' + fileName + '\')"/>');
                }
            });
        }
        function EventInit() {
            $('#PDFFileTranslate').click(function () {
                $.post('FileTranslate.ashx', function (data) {
                    alert(data);
                });
            });
            $('#DOCFileTranslate').click(function () {
                $.post('OfficePDF.ashx', function (data) {
                    alert(data);
                });
            });
        }

        function FilePreview(data) {
            window.open('TemplateHTML.html?name=' + data);
        }
    </script>
</head>
<body>
    <div>
        <input type="button" value="Doc转PDF" id="DOCFileTranslate" />
        <input type="button" value="PDF转SWF" id="PDFFileTranslate" />
    </div>
</body>
</html>
