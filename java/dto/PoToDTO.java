import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
//import org.junit.Test;

/**
 * 通过反射将Po对象转DTO对象
 *
 * @author libo
 * @date 2018年9月20日 下午6:40:07
 */
public class PoToDTO {

    /**
     * 将po对象的属性值赋值给dto对象相同属性名的属性
     * 此方法能将第一个转第二个无论是否DTO
     * @param po 赋值的对象
     * @param dto 被赋值的对象
     * @return
     * @throws Exception
     */
    public Object poToDto(Object po, Object dto) throws Exception {
        Class poClass = po.getClass();
        Class dtoClass = dto.getClass();
        // 取得po对象的所有属性
        Field[] poFields = poClass.getDeclaredFields();
        //取父类的所有属性
        Field[] superPoFields = poClass.getSuperclass().getDeclaredFields();
        //合并数组
        poFields = (Field[]) mergeArray(poFields,superPoFields);

        // 遍历拼接dto的set方法字段表示
        for (Field f : poFields) {
            String fieldName = f.getName();
            //取得当前get，set字符串表达形式
            String dtoSetMethodName = "set" + firstToBig(fieldName);
            String poGetMethodName = "get"+firstToBig(fieldName);

            //System.out.println(fieldName + "=====" + dtoSetMethodName);
            // 取得DTO对象的set方法
            Method dtoSetMethod=null;
            try {
                dtoSetMethod = dtoClass.getMethod(dtoSetMethodName, f.getType());
            }catch (NoSuchMethodException e) {//如果不存在此方法跳过，
                continue;
            }
            //取得Po对象的get方法
            Method poGetMethod = poClass.getMethod(poGetMethodName, null);
            // 将po对象的属性值set到dto对象中去
            dtoSetMethod.invoke(dto, poGetMethod.invoke(po, null));
        }
        return dto;

    }

    /**
     * 合并数组
     * @param a
     * @param b
     * @return
     */
    public Object[] mergeArray(Object[] a,Object[] b) {
        Object[] c = Arrays.copyOf(a, a.length+b.length);
        System.arraycopy(b, 0, c, a.length, b.length);
        return c;
    }

    /**
     * 首字母大写
     *
     * @param fieldName
     * @return
     */
    public String firstToBig(String fieldName) {
        if (fieldName != null && fieldName != "") {
            fieldName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
        }
        return fieldName;
    }

    //@Test
    public void test() {
        Student stu = new Student();
        stu.setId(1);
        stu.setName("李波");
        stu.setAge(22);
        stu.setAddress("郴州");

        StudentDTO stuDto = new StudentDTO();
        System.out.println("之前===="+stuDto);
        try {
            stuDto = (StudentDTO) poToDto(stu, stuDto);
            System.out.println("之后===="+stuDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //@Test//测试将dto转po
    public void test2() {
        StudentDTO stuDTO = new StudentDTO();
        stuDTO.setId(1);
        stuDTO.setName("李波");
        stuDTO.setAge(22);
        stuDTO.setAddress("郴州");

        Student stu = new Student();
        Student ss = stuDTO;
        System.out.println("之前===="+stu);
        try {
            stu = (Student) poToDto(stuDTO, stu);
            System.out.println("之后===="+stu);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public static void main(String[] args){
		PoToDTO tc = new PoToDTO();
		tc.test();
		tc.test2();

	}
}
