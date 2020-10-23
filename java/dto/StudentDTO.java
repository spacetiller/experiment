/**
 * @author libo
 * @date 2018年9月20日 下午8:45:56
 */
public class StudentDTO extends Student{

    private Integer starAge;
    private Integer endAge;

    public Integer getStarAge() {
        return starAge;
    }
    public void setStarAge(Integer starAge) {
        this.starAge = starAge;
    }
    public Integer getEndAge() {
        return endAge;
    }
    public void setEndAge(Integer endAge) {
        this.endAge = endAge;
    }
    @Override
    public String toString() {
        return "StudentDTO [starAge=" + starAge + ", endAge=" + endAge + "]"+super.toString();
    }


}
