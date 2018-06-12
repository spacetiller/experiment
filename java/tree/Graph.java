package com.izp.test.tree;  
  
import java.util.ArrayList;  
import java.util.List;  
  
/** 
 * ͼ�Ķ��� 
 * @author zas 
 */  
public class Graph {  
    //ͼ�ĵ��б�  
    List<Point> pointList;  
    //ͼ�ı��б�  
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
     * ���һ���㵽ͼ�� 
     * @param p 
     */  
    public void addPoint(Point p) {  
        if(pointList == null){  
            pointList = new ArrayList<Point>();  
        }  
        pointList.add(p);  
    }  
      
    /** 
     * ��ͼ��ɾ��һ���� 
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
     * ���һ���ߵ�ͼ�� 
     * @param p 
     */  
    public void addEdge(EdgeWithWeight e) {  
        if(edgeList == null){  
            edgeList = new ArrayList<EdgeWithWeight>();  
        }  
        edgeList.add(e);  
    }  
      
    /** 
     * ��ͼ��ɾ��һ���� 
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
     * ���Ƿ������ͼ�� 
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
     * ���Ƿ������ͼ�� 
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
     * ����Ƿ������· 
           ������ڻ�·����ش���һ����ͼ����һ����·����·�����ж���Ķ�>=2��   
        n�㷨��    
            ��һ����ɾ�����ж�<=1�Ķ��㼰��صıߣ�������������Щ����ص���������Ķȼ�һ��   
            �ڶ�������������Ϊ1�Ķ���������У����Ӹö�����ȡ��һ�������ظ�����һ��   
            ��������δɾ�����㣬����ڻ�������û�л���   
        n�㷨������    
            ������m���ߣ�n�����㡣 
            i)���m>=n�������ͼ��֪ʶ��ֱ���жϴ��ڻ�·����֤�������û�л�·�����ͼ��Ȼ��k���� k>=1�������������ʣ��ߵ���Ŀm = n-k��k>=1�����ԣ�m<n��               
            ii)���m<n ����������㷨ÿɾ��һ����Ϊ0�Ķ������һ�Σ����n�Σ�����ÿɾ��һ����Ϊ1�Ķ��㣨ͬʱɾһ���ߣ�����һ�Σ����m�Σ��������ֲ������������ᳬ��m+n������m<n�������㷨���Ӷ�ΪO(n)�� 
     * @param this 
     * @return 
     */  
    public boolean isGraphHasCircle() {  
        //��ͼ��û�ж��㣬����ֻ��һ��������û�л�·  
        if(this.getPointList() == null || this.getPointList().size() < 2){  
            return false;  
        }  
        if(this.getEdgeList().size() > this.getPointList().size()){  
            return true;  
        }  
          
        Graph g = this.clone();  
          
        int pointsLeftCount = g.getPointList().size();  
        while(pointsLeftCount > 0){  
            //һ�α�����û��ɾ��һ����С��2�ĵ㣬�����ѭ��  
            boolean endFlag = true;  
            Point pointForRemove = null;  
            for (Point p : g.getPointList()) {  
                //���㶥��Ķ�  
                if(g.getCountForPoint(p) <= 1){  
                    //Ϊ�˹�����һ�����㱻ɾ���ǵĲ����쳣 ���ñ��ɾ��  
                    pointForRemove = p;  
                    //ɾ��֮����±�������  
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
     * ���㶥��Ķ� 
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