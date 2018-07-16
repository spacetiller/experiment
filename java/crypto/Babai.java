import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
 
import Jama.Matrix;
 
public class Babai {
	public static void main(String args[]) {
		// 输入维数
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.println("请输入格维数：");
			int N = Integer.parseInt(br.readLine());
			System.out.println("请输入格的基：");
			double[][] AMatrixArray = new double[N][N];
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					AMatrixArray[i][j] = Integer.parseInt(br.readLine());
				}
			}
			Matrix AMatrix = new Matrix(AMatrixArray);
			// 输入需要计算的 向量
			double[][] vec = new double[1][N];
			for (int j = 0; j < N; j++) {
				vec[0][j] = Integer.parseInt(br.readLine());
			}
			Matrix b = new Matrix(vec);
			// 计算接近该向量的向量
			Matrix x = b.times(AMatrix.inverse());// 得到精确解
			double[][] appro = new double[1][N];
			for (int i = 0; i < N; i++) {
				appro[0][i] = x.get(0, i);
				if ((double) (x.get(0, i) - (int) appro[0][i]) > 0.5) {
					appro[0][i] = (int) appro[0][i] + 1.0;
				} else
					appro[0][i] = (int) appro[0][i] + 0.0;
			}
			Matrix ApproT = new Matrix(appro);
			Matrix ApproMatrixToVector = ApproT.times(AMatrix);
			// 分析误差以及其与基的Hadamard ratio of the basis
			// 计算相差距离
			double distance = 0;
			for (int i = 0; i < N; i++) {
				distance += Math.pow(
						(ApproMatrixToVector.get(0, i) - b.get(0, i)), 2);
			}
			distance = Math.pow(distance, 0.5);
			System.out.println("由这个基算的的误差为：" + distance);
			// 计算Hadamard ratio of the basis
			double mul =1;
			for(int i=0;i<N;i++)
			{
				double temp=0;
				for(int j =0;j<N;j++){
				temp+=Math.pow(AMatrix.get(i, j),2);
				}
				mul*=Math.pow(temp, 0.5);
			}
			 double HadamardRatio=Math.pow(Math.abs(AMatrix.det()/mul), 0.5);
			 System.out.println("您所输入的基的Hadamard比例为："+HadamardRatio);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}