package com.izp.test.tree;  
  
/** 
 * Ȩ�صĶ��� 
 * @author zas 
 */  
public class Weight implements Comparable<Weight>{  
    //double���Ͷ���һ��Ȩ����Ϣ  
    double weight = 0.0;  
  
    public Weight() {  
        super();  
    }  
      
    public Weight(double weight) {  
        super();  
        this.weight = weight;  
    }  
  
    @Override  
    public int compareTo(Weight o) {  
        if(o.weight == this.weight){  
            return 0;  
        }else if(o.weight > this.weight){  
            return -1;  
        }else{  
            return 1;  
        }  
    }  
    @Override  
    public boolean equals(Object obj) {  
        if(obj instanceof Weight){  
            if(((Weight) obj).weight == this.weight){  
                return true;  
            }  
        }  
        return false;  
    }  
    @Override  
    public String toString() {  
        return "Weight [weight=" + weight + "]";  
    }  
  
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
          
    }  
}  