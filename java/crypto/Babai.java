import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
 
import Jama.Matrix;
 
public class Babai {
	public static void main(String args[]) {
		// ����ά��
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.println("�������ά����");
			int N = Integer.parseInt(br.readLine());
			System.out.println("�������Ļ���");
			double[][] AMatrixArray = new double[N][N];
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					AMatrixArray[i][j] = Integer.parseInt(br.readLine());
				}
			}
			Matrix AMatrix = new Matrix(AMatrixArray);
			// ������Ҫ����� ����
			double[][] vec = new double[1][N];
			for (int j = 0; j < N; j++) {
				vec[0][j] = Integer.parseInt(br.readLine());
			}
			Matrix b = new Matrix(vec);
			// ����ӽ�������������
			Matrix x = b.times(AMatrix.inverse());// �õ���ȷ��
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
			// ��������Լ��������Hadamard ratio of the basis
			// ����������
			double distance = 0;
			for (int i = 0; i < N; i++) {
				distance += Math.pow(
						(ApproMatrixToVector.get(0, i) - b.get(0, i)), 2);
			}
			distance = Math.pow(distance, 0.5);
			System.out.println("���������ĵ����Ϊ��" + distance);
			// ����Hadamard ratio of the basis
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
			 System.out.println("��������Ļ���Hadamard����Ϊ��"+HadamardRatio);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}