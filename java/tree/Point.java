package com.izp.test.tree;  
  
/** 
 * ��Ķ��� ��ʱΪһ������� �������ʵ��ҵ������ ����ӵ�����Զ��� 
 * @author zas 
 */  
public class Point {  
    //��ʱ����Ϊ�ַ������  
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
     * ֻ�е�������ͬ�ĵ�����ͬ�� 
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
