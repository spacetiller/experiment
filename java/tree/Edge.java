package com.izp.test.tree;  
  
/** 
 * 边的定义 
 * @author zas 
 */  
public class Edge {  
    //起点  
    protected Point startPoint;  
    //终点  
    protected Point endPoint;  
      
    public Edge() {  
        super();  
    }  
  
    public Edge(Point startPoint, Point endPoint) {  
        super();  
        this.startPoint = startPoint;  
        this.endPoint = endPoint;  
    }  
  
    public Point getStartPoint() {  
        return startPoint;  
    }  
  
    public void setStartPoint(Point startPoint) {  
        this.startPoint = startPoint;  
    }  
  
    public Point getEndPoint() {  
        return endPoint;  
    }  
  
    public void setEndPoint(Point endPoint) {  
        this.endPoint = endPoint;  
    }  
      
    /* (non-Javadoc) 
     * @see java.lang.Object#equals(java.lang.Object) 
     * 只有起止点相同的边才是同一条边 
     */  
    @Override  
    public boolean equals(Object obj) {  
        if(obj instanceof Edge){  
            Edge outEdge = (Edge)obj;  
            if(outEdge.startPoint.equals(this.startPoint)){  
                if(outEdge.endPoint.equals(this.endPoint)){  
                    return true;  
                }  
            }  
        }  
        return false;  
    }  
      
    @Override  
    public String toString() {  
        return "Edge [startPoint=" + startPoint + ", endPoint=" + endPoint  
                + "]";  
    }  
      
    /** 
     * 点是否在边中 
     * @param p 
     * @param edge 
     * @return 
     */  
    public boolean isPointInEdge(Point p) {  
        if(p.equals(this.getStartPoint()) || p.equals(this.getEndPoint())){  
            return true;  
        }  
        return false;  
    }  
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
  
    }  
  
}  