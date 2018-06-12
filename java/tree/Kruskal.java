package com.izp.test.tree;  
  
import java.util.ArrayList;  
import java.util.List;  
  
/** 
 * Kruskal算法思想不同于Prim算法， 
 * Kruskal算法是一种按照连通网中边的权值的递增顺序构造最小生成树的算法。 
 * @author zas 
 */  
public class Kruskal {  
    //一个要找最小生成树的图  
    Graph graph;  
      
    public Kruskal() {  
        super();  
    }  
  
    public Kruskal(Graph graph) {  
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
     * Kruskal算法的基本步骤 : 
     * 假设G=(V,E)是一个具有n个顶点的连通网，T=(U,TE)是G的最小生成树。 
     * 令集合U的初值为U=V，即包含有G中全部顶点，集合TE的初值为TE={}。 
     * 然后，将图G中的边按权值从小到大的顺序依次选取，若选取的边使生成树T不形成回路，则把它并入TE中，保留作为T的一条边； 
     * 若选取的边使生成树T形成回路，则将其舍弃，如此进行下去，直到TE中包含有n-1条边为止，此时的T即为最小生成树。 
     * @return 
     */  
    public Graph kruskal() {  
        Graph minTree = new Graph();  
        //将所有顶点加入最小生成树  
        for (Point p : this.getGraph().getPointList()) {  
            minTree.addPoint(p);  
        }  
        //对原图的边按权值从小到大排序  
        List<EdgeWithWeight> edgeList = sortByEdgeAsc(this.graph.getEdgeList());  
        //加入 n - 1条最小权值边  
        for (int i = 0; i < edgeList.size(); i++) {  
            EdgeWithWeight edge = edgeList.get(i);  
            minTree.addEdge(edge);  
            //是否含有环  
            if(minTree.isGraphHasCircle()){  
                minTree.removeEdge(edge);  
            }  
            //结束条件  
            if(minTree.getEdgeList().size() == minTree.getPointList().size() - 1){  
                break;  
            }  
        }  
        return minTree;  
    }  
      
    /** 
     * 对边按权值从小到大排序 
     * @param edgeList 
     * @return 
     */  
    private List<EdgeWithWeight> sortByEdgeAsc(List<EdgeWithWeight> graphEdgeList) {  
        //克隆一下，防止影响到原图  
        List<EdgeWithWeight> edgeList = new ArrayList<EdgeWithWeight>();  
        for (EdgeWithWeight edgeWithWeight : graphEdgeList) {  
            edgeList.add(edgeWithWeight);  
        }  
        //暂时采用选择排序，如果数据规模大、有性能要求可改进  
        int selectedIndex = 0;  
        EdgeWithWeight edgeForSwap = null;  
        for (int i = 0; i < edgeList.size(); i++) {  
            selectedIndex = i;  
            for (int j = i + 1; j < edgeList.size(); j++) {  
                if(edgeList.get(j).compareTo(edgeList.get(selectedIndex)) == 1){  
                    selectedIndex = j;  
                }  
            }  
            if(selectedIndex != i){  
                //交换  
                edgeForSwap = edgeList.get(selectedIndex);  
                edgeList.set(selectedIndex, edgeList.get(i));  
                edgeList.set(i, edgeForSwap);  
            }  
        }  
        return edgeList;  
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
  
        // 所有边权重相同  
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
  
        Kruskal kruskal = new Kruskal(graph);  
        Graph minTree = kruskal.kruskal();  
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
  
        Kruskal kruskalForWeigtTree = new Kruskal(graphWithWeight);  
        Graph minTreeForWeightTree = kruskalForWeigtTree.kruskal();  
        System.out.println(minTreeForWeightTree);  
    }  
  
}  