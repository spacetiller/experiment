package com.izp.test.tree;  
  
import java.util.ArrayList;  
import java.util.List;  
  
/** 
 * Kruskal�㷨˼�벻ͬ��Prim�㷨�� 
 * Kruskal�㷨��һ�ְ�����ͨ���бߵ�Ȩֵ�ĵ���˳������С���������㷨�� 
 * @author zas 
 */  
public class Kruskal {  
    //һ��Ҫ����С��������ͼ  
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
     * Kruskal�㷨�Ļ������� : 
     * ����G=(V,E)��һ������n���������ͨ����T=(U,TE)��G����С�������� 
     * ���U�ĳ�ֵΪU=V����������G��ȫ�����㣬����TE�ĳ�ֵΪTE={}�� 
     * Ȼ�󣬽�ͼG�еı߰�Ȩֵ��С�����˳������ѡȡ����ѡȡ�ı�ʹ������T���γɻ�·�����������TE�У�������ΪT��һ���ߣ� 
     * ��ѡȡ�ı�ʹ������T�γɻ�·��������������˽�����ȥ��ֱ��TE�а�����n-1����Ϊֹ����ʱ��T��Ϊ��С�������� 
     * @return 
     */  
    public Graph kruskal() {  
        Graph minTree = new Graph();  
        //�����ж��������С������  
        for (Point p : this.getGraph().getPointList()) {  
            minTree.addPoint(p);  
        }  
        //��ԭͼ�ı߰�Ȩֵ��С��������  
        List<EdgeWithWeight> edgeList = sortByEdgeAsc(this.graph.getEdgeList());  
        //���� n - 1����СȨֵ��  
        for (int i = 0; i < edgeList.size(); i++) {  
            EdgeWithWeight edge = edgeList.get(i);  
            minTree.addEdge(edge);  
            //�Ƿ��л�  
            if(minTree.isGraphHasCircle()){  
                minTree.removeEdge(edge);  
            }  
            //��������  
            if(minTree.getEdgeList().size() == minTree.getPointList().size() - 1){  
                break;  
            }  
        }  
        return minTree;  
    }  
      
    /** 
     * �Ա߰�Ȩֵ��С�������� 
     * @param edgeList 
     * @return 
     */  
    private List<EdgeWithWeight> sortByEdgeAsc(List<EdgeWithWeight> graphEdgeList) {  
        //��¡һ�£���ֹӰ�쵽ԭͼ  
        List<EdgeWithWeight> edgeList = new ArrayList<EdgeWithWeight>();  
        for (EdgeWithWeight edgeWithWeight : graphEdgeList) {  
            edgeList.add(edgeWithWeight);  
        }  
        //��ʱ����ѡ������������ݹ�ģ��������Ҫ��ɸĽ�  
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
                //����  
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
  
        // ���б�Ȩ����ͬ  
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