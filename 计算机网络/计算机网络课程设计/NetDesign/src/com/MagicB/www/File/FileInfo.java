package com.MagicB.www.File;

import java.io.File;
import java.text.DecimalFormat;
//文件类
public class FileInfo {
    public static String getFileSize(File file){
        String size="";
        if(file.exists() && file.isFile()){//判断文件大小
            Long fileSize= file.length();
            DecimalFormat dF=new DecimalFormat("#.00");
            if(fileSize<1024){
                size=dF.format((double)fileSize)+"B";
            }
            else if(fileSize<1048576){
                size=dF.format((double)fileSize/1024)+"KB";
            }
            else if(fileSize<1073741824){
                size=dF.format((double)fileSize/1048576)+"MB";
            }
            else{
                size=dF.format((double)fileSize/1073741824)+"GB";
            }
        }
        else if(file.exists() && file.isDirectory()){
            size="";
        }
        else{
            size="0B";
        }
        return size;
    }
}
