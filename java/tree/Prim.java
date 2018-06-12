package com.izp.test.tree;  
  
  
/** 
 * Prim算法实现的是找出一个有权重连通图中的最小生成树，即：具有最小权重且连接到所有结点的树。 
 * @author zas 
 */  
public class Prim {  
    //一个要找最小生成树的图  
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
     * 首先以一个结点作为最小生成树的初始结点，然后以迭代的方式找出与最小生成树中各结点权重最小边， 
     * 并加入到最小生成树中。加入之后如果产生回路则跳过这条边，选择下一个结点。 
     * 当所有结点都加入到最小生成树中之后，就找出了连通图中的最小生成树了。 
     * @return 
     */  
    public Graph prim() {  
        Graph minTree = new Graph();  
        for (Point p : graph.getPointList()) {  
            minTree.addPoint(p);  
            //获得该点的最小权重边  
            EdgeWithWeight edge = getMinWeightEdgeForPoit(p, minTree);  
            if(null != edge){  
                //添加该边到最小生成树  
                minTree.addEdge(edge);  
                //检测是否产生回路  
                if(minTree.isGraphHasCircle()){  
                    minTree.removeEdge(edge);  
                }  
            }  
        }  
        return minTree;  
    }  
      
  
    /** 
     * 获取权重最小边 
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
        //构建一个图  
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
          
        //所有边权重相同  
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