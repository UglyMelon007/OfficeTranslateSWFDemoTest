<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UM007.SWFPreviewOnline._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="Resource/CSS/uploadify.css" rel="stylesheet" />
    <script type="text/javascript" src="Resource/JS/jquery.js"></script>
    <script type="text/javascript" src="Resource/JS/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="Resource/JS/swfobject.js"></script>
    <script type="text/javascript">
        $(function () {
            PageInit();
            EventInit();
        });
        function PageInit() {
            $.post('Resource/ASHX/PageInit.ashx', function (data) {
                if (data === '') return;
                var fileNames = data.split(',');
                for (var index in fileNames) {
                    var fileName = fileNames[index];
                    $('#PDFFileTranslate').after('<input type="button" value="' + fileName + '预览"  onclick="FilePreview(\'' + fileName + '\')"/>');
                }
            });
        }
        function EventInit() {
            $("#file_upload").uploadify({
                //开启调试
                'debug': false,
                //是否自动上传
                'auto': false,
                'buttonText': '选择文件',
                //flash
                'swf': 'Resource/SWF/uploadify.swf',
                //文件选择后的容器ID
                'queueID': 'uploadfileQueue',
                'uploader': 'Resource/ASHX/upload.ashx',
                'width': '75',
                'height': '24',
                'multi': false,
                'fileTypeDesc': '支持的格式：',
                'fileTypeExts': '*.pdf',
                'fileSizeLimit': '100MB',
                'removeTimeout': 100,

                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                },
                //检测FLASH失败调用
                'onFallback': function () {
                    alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
                },
                //上传到服务器，服务器返回相应信息到data里
                'onUploadSuccess': function (file, data, response) {
                    alert("文件:" + data + "上传成功");
                }
            });

            $('#FileUpload').click(doUplaod);

            $('#CancelUpload').click(closeLoad);

            $('#PDFFileTranslate').click(function () {
                $.post('Resource/ASHX/FileTranslate.ashx', function (data) {
                    alert(data);
                });
            });

            $('#DOCFileTranslate').click(function () {
                $.post('Resource/ASHX/OfficePDF.ashx', function (data) {
                    alert(data);
                });
            });
        }

        function FilePreview(data) {
            window.open('TemplateHTML.html?name=' + data);
        }

        function doUplaod() {
            $('#file_upload').uploadify('upload', '*');
        }

        function closeLoad() {
            $('#file_upload').uploadify('cancel', '*');
        }
    </script>
</head>
<body>
    <div id="uploadfileQueue" style="padding: 3px;"></div>
    <div id="file_upload"></div>
    <div>
        <input type="button" value="文件上传" id="FileUpload" />
        <input type="button" value="取消上传" id="CancelUpload" />
        <input type="button" value="Doc转PDF" id="DOCFileTranslate" />
        <input type="button" value="PDF转SWF" id="PDFFileTranslate" />
    </div>
</body>
</html>
