# -- coding: utf-8 --

class SGD:
    ''' 
        SGD Class
    '''
    weights = 0
    bias = 0
    def __init__(self, w = 0, b = 0):
        '''Initializes the person's data.'''
        self.weights = w
        self.bias = b

		def sgd(self, training_data, epochs, mini_batch_size, eta, test_data=None):
		    if test_data:
		        n_test = len(test_data)#有多少个测试集
		        n = len(training_data)
		        for j in xrange(epochs):
		            random.shuffle(training_data)
		            mini_batches = [
		                training_data[k:k+mini_batch_size] 
		                for k in xrange(0,n,mini_batch_size)]
		            for mini_batch in mini_batches:
		                self.update_mini_batch(mini_batch, eta)
		            if test_data:
		                print "Epoch {0}: {1}/{2}".format(j, self.evaluate(test_data),n_test)
		            else:
		                print "Epoch {0} complete".format(j)   
		
		def update_mini_batch(self, mini_batch,eta): 
		    nabla_b = [np.zeros(b.shape) for b in self.biases]
		    nabla_w = [np.zeros(w.shape) for w in self.weights]
		    for x,y in mini_batch:
		        delta_nabla_b, delta_nable_w = self.backprop(x,y)#目标函数对b和w的偏导数
		        nabla_b = [nb+dnb for nb,dnb in zip(nabla_b,delta_nabla_b)]
		        nabla_w = [nw+dnw for nw,dnw in zip(nabla_w,delta_nabla_w)]#累加b和w
		    #最终更新权重为
		    self.weights = [w-(eta/len(mini_batch))*nw for w, nw in zip(self.weights, nabla_w)]
		    self.baises = [b-(eta/len(mini_batch))*nb for b, nb in zip(self.baises, nabla_b)]











