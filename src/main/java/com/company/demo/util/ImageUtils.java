package com.company.demo.util;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/** 上传的图片 处理工具类
 * @author yangkun
 *
 */
public class ImageUtils {
    
    /** 计算图片尺寸大小等信息：w宽、h高、s大小。异常时返回null。 
     * @param imgfile 图片对象
     * @return 图片信息map 
     */
    public static Map<String, Long> getImgInfo(File imgfile) {
    	 Map<String, Long> map = new HashMap<String, Long>(3); 
         try { 
                 FileInputStream fis = new FileInputStream(imgfile); 
                 BufferedImage buff = ImageIO.read(imgfile); 
                 map.put("w", buff.getWidth() * 1L); 
                 map.put("h", buff.getHeight() * 1L); 
                 map.put("s", imgfile.length()); 
                 fis.close(); 
                 return map; 
         } catch (FileNotFoundException e) { 
                 System.err.println("所给的图片文件" + imgfile.getPath() + "不存在！计算图片尺寸大小信息失败！"); 
                 map = null; 
         } catch (IOException e) { 
                 System.err.println("计算图片" + imgfile.getPath() + "尺寸大小信息失败！"); 
                 map = null; 
         } 
         return null; 
    }
    
	/** 图像类型转换
	 * @param source 目标文件对象
	 * @param type 目标类型
	 * @param result 结果文件对象
	 */
	public static void convert(File source,String type,File result) {
		try {
			if(source.canRead()&&source.canWrite()){
				BufferedImage src = ImageIO.read(source);
				ImageIO.write(src,type.toUpperCase(),result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 更改指定图片大小(缩放)
	 * @param is  源图片流
	 * @param os 新的目标图片流
	 * @param newWidth  新宽
	 * @param newHeight 新高
	 * @param format 格式
	 * @throws IOException
	 */
	public static void resizeImage(InputStream is, OutputStream os,int newWidth,int newHeight,String format) throws IOException {    
	    BufferedImage prevImage = ImageIO.read(is);

	    double width = prevImage.getWidth();    
	    double height = prevImage.getHeight();
	    double percent = 0;
	    int x=0;int y=0;

	    if(width>height){
	    	percent=newHeight/height;
	    }else{
	    	percent=newWidth/width;
	    }
	    int zWidth = (int)(width * percent);    
	    int zHeight = (int)(height * percent);
		x=(newWidth-zWidth)/2;
		y=(newHeight-zHeight)/2;
	    BufferedImage image = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_BGR);
	    Graphics graphics = image.createGraphics();    
	    graphics.drawImage(prevImage.getScaledInstance(zWidth, zHeight,Image.SCALE_SMOOTH), x,y,null); 
        
	    ImageIO.write(image,format,os);    
	    os.flush();    
	    is.close();    
	    os.close();    
	}
	
    
    /**
     * 对图片类型进行检查
     * .jpg .jpeg .jpe .jfif ===> JPEG
     * .png ===> png
     * .gif ===> gif
     * @param  input  输入流对象
     * @return 图片格式
     */
	public static String getFormatName(Object input) {
        try {
            // Create an image input stream on the image
            ImageInputStream iis = ImageIO.createImageInputStream(input);
            // Find all image readers that recognize the image format
            Iterator<ImageReader> iter = ImageIO.getImageReaders(iis);
            if (!iter.hasNext()) {
                // No readers found
                return null;
            }
            // Use the first reader
            ImageReader reader = (ImageReader) iter.next();
            //关闭流
            iis.close();
            return reader.getFormatName();
        } catch (IOException e) {
            //非图片格式异常，不处理
        }
        //非图片格式
        return null;
    }
	
    
    
    
    
    
	public static void main(String[] args) {
		try {
			File f = new File("C:\\Users\\jsb-bd\\Desktop\\1453799163255.jpg");
			FileInputStream fis = new FileInputStream(f);
			resizeImage(fis
			,new FileOutputStream(new File("C:\\Users\\jsb-bd\\Desktop\\21.jpg")),120,120,"jpg");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
