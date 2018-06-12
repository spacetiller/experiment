package com.izp.test.tree;  
  
  
/** 
 * Prim�㷨ʵ�ֵ����ҳ�һ����Ȩ����ͨͼ�е���С������������������СȨ�������ӵ����н������� 
 * @author zas 
 */  
public class Prim {  
    //һ��Ҫ����С��������ͼ  
    Graph graph;  
      
    public Prim(Graph graph) {  
        super();  
        this.graph = graph;  
    }  
  
    public Graph getGraph() {  
        return graph;  
    }  
  
    public void setGraph(Graph graph) {  
        this.graph = graph;  
    }  
      
    /** 
     * ������һ�������Ϊ��С�������ĳ�ʼ��㣬Ȼ���Ե����ķ�ʽ�ҳ�����С�������и����Ȩ����С�ߣ� 
     * �����뵽��С�������С�����֮�����������·�����������ߣ�ѡ����һ����㡣 
     * �����н�㶼���뵽��С��������֮�󣬾��ҳ�����ͨͼ�е���С�������ˡ� 
     * @return 
     */  
    public Graph prim() {  
        Graph minTree = new Graph();  
        for (Point p : graph.getPointList()) {  
            minTree.addPoint(p);  
            //��øõ����СȨ�ر�  
            EdgeWithWeight edge = getMinWeightEdgeForPoit(p, minTree);  
            if(null != edge){  
                //��Ӹñߵ���С������  
                minTree.addEdge(edge);  
                //����Ƿ������·  
                if(minTree.isGraphHasCircle()){  
                    minTree.removeEdge(edge);  
                }  
            }  
        }  
        return minTree;  
    }  
      
  
    /** 
     * ��ȡȨ����С�� 
     * @param p 
     * @param minTree 
     * @return 
     */  
    private EdgeWithWeight getMinWeightEdgeForPoit(Point p, Graph minTree) {  
        EdgeWithWeight e = null;  
        for (EdgeWithWeight edge : graph.getEdgeList()) {  
            if(!minTree.isEdgeInGraph(edge)){  
                if(edge.isPointInEdge(p)){  
                    if(e == null){  
                        e = edge;  
                    }else{  
                        if(e.compareTo(edge) == -1){  
                            e = edge;  
                        }  
                    }  
                }  
            }  
        }  
        return e;  
    }  
  
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
        //����һ��ͼ  
        Graph graph = new Graph();  
          
        Point a = new Point("A");  
        Point b = new Point("B");  
        Point c = new Point("C");  
        Point d = new Point("D");  
        Point e = new Point("E");  
        Point f = new Point("F");  
          
        graph.addPoint(a);  
        graph.addPoint(b);  
        graph.addPoint(c);  
        graph.addPoint(d);  
        graph.addPoint(e);  
        graph.addPoint(f);  
          
        //���б�Ȩ����ͬ  
        graph.addEdge(new EdgeWithWeight(a, b, new Weight()));  
        graph.addEdge(new EdgeWithWeight(a, c, new Weight()));  
        graph.addEdge(new EdgeWithWeight(a, d, new Weight()));  
        graph.addEdge(new EdgeWithWeight(b, c, new Weight()));  
        graph.addEdge(new EdgeWithWeight(b, e, new Weight()));  
        graph.addEdge(new EdgeWithWeight(c, d, new Weight()));  
        graph.addEdge(new EdgeWithWeight(c, e, new Weight()));  
        graph.addEdge(new EdgeWithWeight(c, f, new Weight()));  
        graph.addEdge(new EdgeWithWeight(d, f, new Weight()));  
        graph.addEdge(new EdgeWithWeight(e, f, new Weight()));  
          
        Prim prim = new Prim(graph);  
        Graph minTree = prim.prim();  
        System.out.println(minTree);  
          
          
        Graph graphWithWeight = new Graph();  
          
        graphWithWeight.addPoint(a);  
        graphWithWeight.addPoint(b);  
        graphWithWeight.addPoint(c);  
        graphWithWeight.addPoint(d);  
        graphWithWeight.addPoint(e);  
        graphWithWeight.addPoint(f);  
          
        graphWithWeight.addEdge(new EdgeWithWeight(a, b, new Weight(6)));  
        graphWithWeight.addEdge(new EdgeWithWeight(a, c, new Weight(1)));  
        graphWithWeight.addEdge(new EdgeWithWeight(a, d, new Weight(5)));  
        graphWithWeight.addEdge(new EdgeWithWeight(b, c, new Weight(5)));  
        graphWithWeight.addEdge(new EdgeWithWeight(b, e, new Weight(3)));  
        graphWithWeight.addEdge(new EdgeWithWeight(c, d, new Weight(7)));  
        graphWithWeight.addEdge(new EdgeWithWeight(c, e, new Weight(5)));  
        graphWithWeight.addEdge(new EdgeWithWeight(c, f, new Weight(4)));  
        graphWithWeight.addEdge(new EdgeWithWeight(d, f, new Weight(2)));  
        graphWithWeight.addEdge(new EdgeWithWeight(e, f, new Weight(6)));  
          
        Prim primForWeigtTree = new Prim(graphWithWeight);  
        Graph minTreeForWeightTree = primForWeigtTree.prim();  
        System.out.println(minTreeForWeightTree);  
    }  
  
}  