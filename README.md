# OfficeTranslateSWFDemoTest
将一些常用的文档如excel、word、ppt转换成swf文件  
##若转换程序不能使用解决
请装office扩展程序[SaveAsPDFandXPS](Source\SaveAsPDFandXPS.exe)

##部分中文乱码解决
* 下载文件[xpdf](Source/xpdf.zip)并解压至相应路径
* 修改xpdf内add-to-xpdfrc文件(*注意相关路径*)  
>\#----- begin Chinese Simplified support package (2011-sep-02)  
cidToUnicode    Adobe-GB1    d:\xpdf\xpdf-chinese-simplified\Adobe-GB1.cidToUnicode  
unicodeMap    ISO-2022-CN    d:\xpdf\xpdf-chinese-simplified\ISO-2022-CN.unicodeMap  
unicodeMap    EUC-CN        d:\xpdf\xpdf-chinese-simplified\EUC-CN.unicodeMap  
unicodeMap    GBK        d:\xpdf\xpdf-chinese-simplified\GBK.unicodeMap  
cMapDir        Adobe-GB1    d:\xpdf\xpdf-chinese-simplified\CMap  
toUnicodeDir            d:\xpdf\xpdf-chinese-simplified\CMap  
displayCIDFontTT    Adobe-GB1    d:\xpdf\xpdf-chinese-simplified\CMap\gbsn00lp.ttf  
displayCIDFontTT    Adobe-GB1    d:\xpdf\xpdf-chinese-simplified\CMap\gkai00mp.ttf  
\#fontFileCC	Adobe-GB1	/usr/..../gkai00mp.ttf  
\#----- end Chinese Simplified support package  
* 添加代码 `sb.Append(" -s languagedir=C:\\xpf\\xpdf-chinese-simplified"); `

##文件过于复杂解决(参照此解决)
###pdf2swf 转换时报：    
ERROR   ID Table overflow    
ERROR   This file is too complex to render- SWF only supports 65536 shapes at once    
    
是因为需要转换的那个文件太复杂，该软件只能支持65536shapes 的文件转换。    
后台的处理命令为:    
 pdf2swf 1.pdf -o 1.swf -f -T 9     
解决方法：    
 pdf2swf 1.pdf -o 1.swf -f -T 9 -G -s poly2bitmap    只对文件中的图形转成点阵    
 pdf2swf 1.pdf -o 1.swf -f -T 9 -G -s bitmap    对everything 转成点阵    
pdf2swf 1.pdf -o 1.swf -f -T 9 -G -s enablezlib  bitmap    对everything 转成点阵，并通过enablezlib压缩    
处理这个问题可以按上面的方法，在转换时加入参数-s poly2bitmap 或者其他的来将文件中的图形转成点阵，这个是由于文件大太或者文件图形过多而引起的异常，所以建议在转换的过程时加入了文件的大小的判断，当文件过大时，就加入这个参数，不然就直接转，不加入这个参数时，转换的速度快一点

##文件小于一页转换成的swf Flexpaper无法观看
**在用pdf2swf转换文件时添加参数 -T 9
