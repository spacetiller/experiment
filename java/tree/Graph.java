package com.izp.test.tree;  
  
import java.util.ArrayList;  
import java.util.List;  
  
/** 
 * 图的定义 
 * @author zas 
 */  
public class Graph {  
    //图的点列表  
    List<Point> pointList;  
    //图的边列表  
    List<EdgeWithWeight> edgeList;  
      
    public Graph() {  
        super();  
    }  
  
    public Graph(List<Point> pointList, List<EdgeWithWeight> edgeList) {  
        super();  
        this.pointList = pointList;  
        this.edgeList = edgeList;  
    }  
      
    /** 
     * 添加一个点到图中 
     * @param p 
     */  
    public void addPoint(Point p) {  
        if(pointList == null){  
            pointList = new ArrayList<Point>();  
        }  
        pointList.add(p);  
    }  
      
    /** 
     * 从图中删除一个点 
     * @param p 
     */  
    public void removePoint(Point p){  
        for (Point point : pointList) {  
            if(p.equals(point)){  
                pointList.remove(point);  
                break;  
            }  
        }  
    }  
      
    /** 
     * 添加一条边到图中 
     * @param p 
     */  
    public void addEdge(EdgeWithWeight e) {  
        if(edgeList == null){  
            edgeList = new ArrayList<EdgeWithWeight>();  
        }  
        edgeList.add(e);  
    }  
      
    /** 
     * 从图中删除一条边 
     * @param p 
     */  
    public void removeEdge(EdgeWithWeight e) {  
        for (EdgeWithWeight edge : edgeList) {  
            if(e.equals(edge)){  
                edgeList.remove(edge);  
                break;  
            }  
        }  
    }  
      
    /** 
     * 点是否存在于图中 
     * @param p 
     * @return 
     */  
    public boolean isPointInGraph(Point p) {  
        if(null == pointList || pointList.size() < 1){  
            return false;  
        }  
        for (Point point : pointList) {  
            if(p.equals(point)){  
                return true;  
            }  
        }  
        return false;  
    }  
      
    /** 
     * 点是否存在于图中 
     * @param p 
     * @return 
     */  
    public boolean isEdgeInGraph(EdgeWithWeight e) {  
        if(null == edgeList || edgeList.size() < 1){  
            return false;  
        }  
        for (EdgeWithWeight edge : edgeList) {  
            if(e.equals(edge)){  
                return true;  
            }  
        }  
        return false;  
    }  
  
    public List<Point> getPointList() {  
        return pointList;  
    }  
  
    public void setPointList(List<Point> pointList) {  
        this.pointList = pointList;  
    }  
  
    public List<EdgeWithWeight> getEdgeList() {  
        return edgeList;  
    }  
  
    public void setEdgeList(List<EdgeWithWeight> edgeList) {  
        this.edgeList = edgeList;  
    }  
      
    @Override  
    public String toString() {  
        return "Graph [pointList=" + pointList + ", edgeList=" + edgeList + "]";  
    }  
      
    @Override  
    public Graph clone() {  
        Graph g = new Graph();  
        for (Point p : pointList) {  
            g.addPoint(p);  
        }  
        for (EdgeWithWeight e : edgeList) {  
            g.addEdge(e);  
        }  
        return g;  
    }  
      
    /** 
     * 检测是否产生回路 
           如果存在回路，则必存在一个子图，是一个环路。环路中所有顶点的度>=2。   
        n算法：    
            第一步：删除所有度<=1的顶点及相关的边，并将另外与这些边相关的其它顶点的度减一。   
            第二步：将度数变为1的顶点排入队列，并从该队列中取出一个顶点重复步骤一。   
            如果最后还有未删除顶点，则存在环，否则没有环。   
        n算法分析：    
            由于有m条边，n个顶点。 
            i)如果m>=n，则根据图论知识可直接判断存在环路。（证明：如果没有环路，则该图必然是k棵树 k>=1。根据树的性质，边的数目m = n-k。k>=1，所以：m<n）               
            ii)如果m<n 则按照上面的算法每删除一个度为0的顶点操作一次（最多n次），或每删除一个度为1的顶点（同时删一条边）操作一次（最多m次）。这两种操作的总数不会超过m+n。由于m<n，所以算法复杂度为O(n)。 
     * @param this 
     * @return 
     */  
    public boolean isGraphHasCircle() {  
        //若图中没有顶点，或者只有一个顶点则没有回路  
        if(this.getPointList() == null || this.getPointList().size() < 2){  
            return false;  
        }  
        if(this.getEdgeList().size() > this.getPointList().size()){  
            return true;  
        }  
          
        Graph g = this.clone();  
          
        int pointsLeftCount = g.getPointList().size();  
        while(pointsLeftCount > 0){  
            //一次遍历如没有删除一个度小于2的点，则结束循环  
            boolean endFlag = true;  
            Point pointForRemove = null;  
            for (Point p : g.getPointList()) {  
                //计算顶点的度  
                if(g.getCountForPoint(p) <= 1){  
                    //为了规避最后一个顶点被删除是的并发异常 采用标记删除  
                    pointForRemove = p;  
                    //删除之后从新遍历顶点  
                    endFlag = false;  
                    break;  
                }  
            }  
            if(endFlag){  
                break;  
            }else{  
                g.removePoint(pointForRemove);  
                List<EdgeWithWeight> edgeForRemoveList = new ArrayList<EdgeWithWeight>();  
                for (EdgeWithWeight e : g.getEdgeList()) {  
                    if(e.isPointInEdge(pointForRemove)){  
                        edgeForRemoveList.add(e);  
                    }  
                }  
                for (EdgeWithWeight edgeWithWeight : edgeForRemoveList) {  
                    g.removeEdge(edgeWithWeight);  
                }  
            }  
            pointsLeftCount = g.getPointList().size();  
        }  
        if(g.getPointList().size() > 0){  
            return true;  
        }else{  
            return false;  
        }  
    }  
      
    /** 
     * 计算顶点的度 
     * @param p 
     * @return 
     */  
    private int getCountForPoint(Point p) {  
        int count = 0;  
        for (EdgeWithWeight e : this.getEdgeList()) {  
            if(e.isPointInEdge(p)){  
                count = count + 1;  
            }  
        }  
        return count;  
    }  
      
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
  
    }  
  
}  