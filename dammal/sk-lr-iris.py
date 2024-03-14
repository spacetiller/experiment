import sys
import numpy as np

from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

def load_data():
       input_data = datasets.load_iris()
       x_train, x_test, y_train, y_test = train_test_split(input_data.data, input_data.target, test_size = 0.2, random_state = 0)
       return x_train, x_test, y_train, y_test


def main():
        print("---------")
        x_train, x_test, y_train, y_test = load_data()
        model = LogisticRegression()
        model.fit(x_train, y_train)

        print("w: ", model.coef_)
        print("b: ", model.intercept_)
        print("precision: ", model.score(x_test, y_test))
        print("MSE: ", np.mean((model.predict(x_test) - y_test) ** 2))

if __name__ == '__main__':
        main()
