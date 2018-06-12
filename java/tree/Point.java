package com.izp.test.tree;  
  
/** 
 * 点的定义 暂时为一个标记类 如果有现实的业务需求 再添加点的属性定义 
 * @author zas 
 */  
public class Point {  
    //暂时定义为字符串标记  
    String point;  
      
    public Point() {  
        super();  
    }  
  
    public Point(String point) {  
        super();  
        this.point = point;  
    }  
  
    public String getPoint() {  
        return point;  
    }  
  
    public void setPoint(String point) {  
        this.point = point;  
    }  
      
    /* (non-Javadoc) 
     * @see java.lang.Object#equals(java.lang.Object) 
     * 只有点描述相同的点是相同的 
     */  
    @Override  
    public boolean equals(Object obj) {  
        if(obj instanceof Point){  
            if(((Point) obj).point.equals(this.point)){  
                return true;  
            }  
        }  
        return false;  
    }  
  
    @Override  
    public String toString() {  
        return "Point [point=" + point + "]";  
    }  
  
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
  
    }  
  
}  
