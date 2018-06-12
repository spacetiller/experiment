package com.izp.test.tree;  
  
public class EdgeWithWeight extends Edge implements Comparable<EdgeWithWeight> {  
    //±ßµÄÈ¨ÖØ  
    Weight weight;  
      
    public EdgeWithWeight() {  
        super();  
    }  
  
    public EdgeWithWeight(Point startPoint, Point endPoint) {  
        super(startPoint, endPoint);  
    }  
  
    public EdgeWithWeight(Weight weight) {  
        super();  
        this.weight = weight;  
    }  
      
    public EdgeWithWeight(Point startPoint, Point endPoint, Weight weight) {  
        super(startPoint, endPoint);  
        this.weight = weight;  
    }  
  
    @Override  
    public int compareTo(EdgeWithWeight o) {  
        return o.weight.compareTo(this.weight);  
    }  
      
    public Weight getWeight() {  
        return weight;  
    }  
  
    public void setWeight(Weight weight) {  
        this.weight = weight;  
    }  
  
    @Override  
    public boolean equals(Object obj) {  
        if(obj instanceof EdgeWithWeight){  
            if(((EdgeWithWeight) obj).getStartPoint().equals(this.getStartPoint())){  
                if(((EdgeWithWeight) obj).getEndPoint().equals(this.getEndPoint())){  
                    if(((EdgeWithWeight) obj).getWeight().equals(this.getWeight())){  
                        return true;  
                    }  
                }  
            }  
        }  
        return false;  
    }  
  
    @Override  
    public String toString() {  
        return "EdgeWithWeight [weight=" + weight + ", startPoint="  
                + startPoint + ", endPoint=" + endPoint + "]";  
    }  
  
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
  
    }  
  
}  