$(function () {
    PageInit();
    EventInit();
});
function PageInit() {
    $.post('Resource/ASHX/PageInit.ashx', function (data) {
        if (data === '') return;
        var fileNames = data.split(',');
        for (var index in fileNames) {
            if (fileNames.hasOwnProperty(index)) {
                var fileName = fileNames[index];
                $('#PDFFileTranslate').after('<input type="button" value="' + fileName + '预览"  onclick="FilePreview(\'' + fileName + '\')"/>');
            }
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

    $('#PDFFileTranslate').click(function () {
        $.post('Resource/ASHX/FileTranslate.ashx', function (data) {
            alert(data);
        });
    });
}

function FilePreview(data) {
    window.open('TemplateHTML.html?name=' + data);
}

function doUplaod() {
    //添加参数
    $("#file_upload").uploadify("settings", "formData", { 'someKey': 'someValue', 'someOtherKey': 1 });
    $('#file_upload').uploadify('upload', '*');
}

function closeLoad() {
    $('#file_upload').uploadify('cancel', '*');
}