# Synchronization
 Synchronized is the modifier applicable only methods and blocks but not for classes and varibles.
 If multiple thread are trying to operate on the same java obj then there may be chance of data inconsistance problem. 
 To overcome this problem, we should go for Synchonized keyword. If a method or block declared as Synchonized then at a time only one thread execute that method or block on the given the object.
 so that data inconsistance problem will be resolved.
 
 The main advantage of Synchonized keyword is we can resolve data inconsistance prolem. But main disadvantage Synchonized keyword is, it increases waiting time of thread and creates performace problem.
 
 Internally Synchronization concept is implmented by using locking. Every obj in java has unique loack. Whenever we using Synchronized keyword then only the locked concept come into the picture.
 If a thread wants to execute Synchronized method on the given object. first it has to get lock of that object. Once thread got the lock then it is allowed to execute any Synchronized method on that object.
 Once methods execution completes, automcatically thread releases the lock and acquiring/release the locks are managed by JVM.
 
 
Note: While a thread executing Synchonized methods on given object, the remain thread not allow to execute any Synchonized method simultaneously on same object. But remaining threads are allowed to execute non-simultaneously methods simultaneously.

```
class x{
  sync m1() // while t1 is executing m1 then no other threads can access any sync methods(m1,m2) but can access m3(is not a sync method)
  sync m2()
       m3()
}
```
Lock concept is implemented based on object but not based on method.
e.g-> In the below example wish method is synchronized and thread t1 and t2 are calling same wish simultaneously but the method is declared as synchronized so one thread at time can execute the wish method.
```
class Display{
	
	public synchronized void wish(String name) {
		for(int i=0;i<10;i++) {
			System.out.println("Good Morning:");
			try	{
				Thread.sleep(2000);
			}
			catch(InterruptedException e) {}
			System.out.println(name);
		}
	}
}
class MyThreadSYD extends Thread{
	Display d;
	String name;
	MyThreadSYD(Display d,String name) {
		this.d =d;
		this.name =name;
	}
	public void run() {
		d.wish(name);
	}
}

public class ThreadSynchonizedDemo {

	public static void main(String[] args) {
		Display d=new Display();
		MyThreadSYD t1= new MyThreadSYD(d,"Dhoni");
		MyThreadSYD t2= new MyThreadSYD(d,"Yuvraj");
		t1.start();
		t2.start();
	}

}

```
Class level lock -> every class in java has unique lock, which is nothing but class level lock.

If a thread execute a static synchronized then a thread requires class level. Once thread got class level then it is allowed execute any static synchronized method of that class.

Sample:
public synchronized void wish(String name) {
}

While a thread executing static synchronized method. The remaining threads are not allowed to execute any static synchronized method of that class simultaneously. 
But remaining threads are allowed execute the following methods simultaneously.
1. Normal static methods
2. Synchronized static methods
3. Normal instance methods

# Synchronized Block -  
 If very few lines of code required Synchronization then it is not recommended to declared entire method as  synchronized. We have to enclose those few lines of the code using synchronized block.

 We can declare as synchronized block as follows:
 1. To get lock of current object:
      synchronized(this){
      
       // if a thread got loack of current object then only it is allowed to execute this area
      --
      --
      }
2. To get loack of particular object 'b':
   synchronized(b){
      
       // if a thread got loack of particular object 'b' then only it is allowed to execute this area
      --
      --
      }
4.  To get class level lock:
      synchronized(Display.class){
      
       // if a thread got class level loack of "Display" class, then only it is allowed to execute this area
      --
      --
      }
 e.g:
```
class DisplaySB{
	
	public void wish(String name) {
		;;;;;;;// 1 lack line of code
		synchronized(this) {
		for(int i=0;i<10;i++) {
			System.out.println("Good Morning:");
			try	{
				Thread.sleep(2000);
			}
			catch(InterruptedException e) {}
			System.out.println(name);
		}
		}
		;;;;;;;// 1 lack line of code
	}
	
}

class MyThreadSB extends Thread{
	
	DisplaySB d;
	String name;
	MyThreadSB(DisplaySB d,String name) {
		this.d =d;
		this.name =name;
	}
	public void run() {
		d.wish(name);
	}
}

public class ThreadSynchonizedBlock {

	public static void main(String[] args) {
		DisplaySB d=new DisplaySB();
		//Display d2=new Display();
		MyThreadSB t1= new MyThreadSB(d,"Dhoni");
		MyThreadSB t2= new MyThreadSB(d,"Yuvraj");
		t1.start();
		t2.start();

	}

}


```
