/*
 * A man does the target practice. 10 times shot, 89 rings got,
 *
 * Give all the possibilities, with enumeration algorithm.
 *
 * License: GPL
 **/
#define SUM 89
int sum = 0;
int count = 0;
int main()
{
	int i1,i2,i3,i4,i5,i6,i7,i8,i9,i10;

	for(i1=0;i1<=10;i1++){
	  sum = 0;
	  sum += i1;
	  for(i2=0;i2<=10;i2++){
	    //if( i2 > i1) break; //without order
	    sum +=i2;
	    if( sum + (10 * (10-2)) < SUM) break;
	    for(i3=0;i3<=10;i3++){
	      //if( i3 > i2) break; //without order
	      sum += i3;
	      if( sum + (10 * (10-3)) < SUM) break;
	      for(i4=0;i4<=10;i4++){
	        //if( i4 > i3) break; //without order
	        sum += i4;
		if( sum + (10 * (10-4)) < SUM) break;
		for(i5=0;i5<=10;i5++){
	          //if( i5 > i4) break; //without order
		  sum += i5;
		  if( sum + (10 * (10-5)) < SUM) break;
		  for(i6=0;i6<=10;i6++){
	            //if( i6 > i5) break; //without order 
		    sum += i6;
		    if( sum + (10 * (10-6)) < SUM) break;
		    for(i7=0;i7<=10;i7++){
	              //if( i7 > i6) break; //without order 
		      sum += i7;
		      if( sum + (10 * (10-7)) < SUM) break;
		      for(i8=0;i8<=10;i8++){
	                //if( i8 > i7) break; //without order 
		        sum += i8;
			if( sum + (10 * (10-8)) < SUM) break;
			for(i9=0;i9<=10;i9++){
	                  //if( i9 > i8) break; //without order 
			  sum += i9;
			  if( sum + (10 * (10-9)) < SUM) break;
			  for(i10=0;i10<=10;i10++){
	                    //if( i10 > i9) break; //without order 
			    sum += i10;
			    if(sum == SUM){
			    	printf("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",i1,i2,i3,i4,i5,i6,i7,i8,i9,i10);
				count ++;
			    }
				sum -= i10;
			  }
			  sum -= i9;
			}
			sum -= i8;
		      }
		      sum -= i7;
		    }
		    sum -= i6;
		  }
		  sum -= i5;
		}
		sum -= i4;
	      }
	      sum -= i3;
	    }
	    sum -= i2;
	  }
	  sum -= i1;
	}
	printf("%d possibilities found.\n",count);
	return 0;
}
