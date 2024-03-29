# Multi Threading

1. Introduction
2. The ways to define a Thread
    i. By extending thread class
    ii.By implementing Runnable(I)
3. Getting & Setting name of Thread
4. Thread Priorities
5. The methods to prevent Thread execution
    i. Yield()
    ii. Join()
    iii. Sleep()
6. Synchronization
7. InterThread Communication
     - Notify, Wait, NotifyAll
8. DeadLock
9. Deamon Thread
10. Multithreading enhancement


Multitasking:
-------------
1. Process based Multitasking -> OS multitasking
2. Thead based Multitasking -> program level mutitasking


### Life cycle of Thread
  
     New/Bron  ===================> Ready/Runnable ===================>  Running  =============> Dead
     MT t=new MT()     t.start()                    If TS allocates                if run() 
                                                     processor                      Completed

Defining a Thread - in two ways
------------------
1. By extending Thread Class
2. By implementing Runnable interface

  ### By Extending Thread: 
   
   ```
      class MyThread extends Thread
      {
          // Job of the thread
          public void run(){
            for(int i=0;i<10;i++){
              sopln("Child Thread");
            }
          }
      }
     // Start the thread
     class TheadDemo{
        public static void main(String[] arg){
          MyThread t=new MyThread;  // Thread instantiation
          t.start(); // starting of a thread
          for(int i=0;i<10;i++){
                System.out.println("Main Thread");
          }
       }
     }
     
   ```
   Case-1: Thread Scheduler - responsible for thread scheduling
   Case-2: difference between t.start() and t.run()
     In the case of t.start a new thread will be created but if we call the t.run() the it would be like normal run methods in main thread(no new thread will be created)
  Case-3: Thread start method is responsible to register with thread scheduler and other mandatory activity and invoke run()
  Case-4: overloading run mehtod is applicable but thread class start method will only no-arg run method. Other overloaded run methods should call explicitly. 
   ```
      class MyThread extends Thread
      {
          // Job of the thread
          public void run(){
            for(int i=0;i<10;i++){
              sopln("Child Thread");
            }
          }
          //overloading applicable but it is not called by start method
          public void run(int i){
            for(int i=0;i<10;i++){
              sopln("Child Thread");
            }
          }
      }
     // Start the thread
     class TheadDemo{
        public static void main(String[] arg){
          MyThread t=new MyThread;  // Thread instantiation
          t.start(); // the start will be call only the run() method only.
          for(int i=0;i<10;i++){
                System.out.println("Main Thread");
          }
       }
     }
     
   ```
   
     ##### By implementing Runnable interface: 
     
     Runnable(I) --implements--> Thread --extends--->MyThread
     Runnable(I) --implements--> MyRunnable
     
      
   ```
      class MyRunnable implements Runnable
      {
          // Job of the thread
          public void run(){
            for(int i=0;i<10;i++){
              sopln("Child Thread");
            }
          }
      }
     // Start the thread
     class TheadDemo{
        public static void main(String[] arg){
          MyRunnable r=new MyRunnable();
          MyThread t=new MyThread(r);  // runnable object ref
          t.start(); // start method stats thread calls MyRunnable run() method
          for(int i=0;i<10;i++){
                System.out.println("Main Thread");
          }
       }
     }
     
   ```
   
   ##### Thread class Constructor:
   
   - Thread t=new Thread();
   - Thread t=new Thread(Runnable r);
   - Thread t=new Thread(String name);
   - Thread t=new Thread(Runnable r,String name);
   - Thread t=new Thread(ThreadGroup g,String name);
   - Thread t=new Thread(ThreadGroup g,Runnable r); 
   - Thread t=new Thread(ThreadGroup g,Runnable r,String name); 
   - Thread t=new Thread(ThreadGroup g,Runnable r,String name, long stactsize); 

   ##### Set Thread Name:
    e.g:
    Thread.currentThread().getName();
    MyThread t=new MyThread();
    t.getName();
    Thread.currentThread().setName("Parthi");
    
    ##### Thread Priorities
    
    Valid Range: 1 to 10 
    Thread.MIN_PRIORITY -> 1
    Thread.NORM_PRIORITY -> 5
    Thread.MAX_PRIORITY -> 10
    
    public final int getPriority()
    public final voif setPriority(int p) // allowed values rang:1 to 10 for other  RE: ILLegalArgumentException
    
    Note: The default priority only for main thread 5 but all remaining thread will be inherited from pareent to child.
    
         
   ```
      class MyThread extends Thread
      {
        
      }
     // Start the thread
     class TheadDemo{
        public static void main(String[] arg){
         System.out.println(Thread.currentThread().getPriority()); // 5
         Thead.currentThread().setPriority(8)
          System.out.println(Thread.currentThread().getPriority()); // 8
         MyThread t=new MyThread();
         System.out.println(t.getPriority());  // 8
         t.setPriority(8);
         System.out.println(t.getPriority());  // 10 set the child thread priority
       }
     }
     
   ```
  ##### Prevent a Thread execution by using 
      Yeild()
      join()
      Sleep()
      
      Yeild(); -> this methods causes to pause current executing thread to give the chance for waiting thread for same priority. if there no waiting or all waiting thread are low priority then same thread can continue.
      - If multiple thread waiting with same priority. we can't get which waiting thread will get the priority. Its depends on thread scheduler.
      - The thread which is yeilded, when it will get the chance once again. It depends on thread scheduler.
      
      ProtoType:
       public static native void yield() -> it is native method
       
       State Change(Thread.yield()) ==>  running to ready/runnable state
      
 ```
      class MyThreadYD extends Thread{
	
      public void run() {
		for(int i=0;i<10;i++) {
			Thread.yield();
			System.out.println("Child Thread");
		}
	}
     }

    public class ThreadYieldDemo {

	public static void main(String[] args) {
		
		MyThreadYD t=new MyThreadYD();
		t.start();
		for(int i=0;i<10;i++) {
			System.out.println("Main Thread");
		}
		
	}

    }
```

Join() -> If a thread a want to wait until completing some other thread then we should go for join method.
e.g.: if a thead T1 wants to wait until completion of T2 then T1 has to call T2.join
If T1 executes T2.join then immediately T1 will be entered into waiting state until T2 completes.
Once T2 completes then T1 can continue its execution.

ProtoType: 
public final void join()  throws InteruptedException -> wait until completion of other thread. This method throws InteruptedException, which is checked exception
public final void join(long mills) throws InteruptedException -> wait upto specified time only
public final void join(long mills, int nanosec) throws InteruptedException  -> wait upto specified time only


##### Flow for join method:
      
 ```mermaid
flowchart LR;
    A(New/Born) -->|t.start| B(ready/runnable)-->|if TS allocates processor | c(running)-->|if run method completes| d(Dead)
    c --> |t2.join| e(waiting State - blocked for joining)-->|if t2 completes or if time expires or if waiting thread got interrupted |B
     
```     

##### Sample Code:
```
class MyThreadJD extends Thread{
	
	public void run() {
		for(int i=0;i<10;i++) {
			
			System.out.println("Child Thread");
			try {Thread.sleep(2000); 
			}catch(InterruptedException e) {}
		}
	}
}

public class ThreadJoinDemo {

	public static void main(String[] args) throws InterruptedException {
	
		MyThreadJD t=new MyThreadJD();
		t.start();
		t.join(); // here main thread wait until child thread completees its execution. Once child thread completes then main thread continure its execution.
		t.join(10000); //Here main thread wait for 10 sec for child thread and once time expires then main thread continue its execution
		for(int i=0;i<10;i++) {
			System.out.println("Main Thread");
		}

	}

}
```
##### Sample Code2: Waiting of Child Thread until completing main Thread.

```
class MyThreadJD2 extends Thread{
	
	static Thread mt;
	
 public void run() {
		
		try {
			mt.join();
		}catch(InterruptedException e) {}
		for(int i=0;i<10;i++) {
			System.out.println("Child Thread");
		}
	}
}

public class ThreadJoinDemo2 {

public static void main(String[] args) throws InterruptedException {
		
		MyThreadJD2.mt=Thread.currentThread();
		
		MyThreadJD2 t=new MyThreadJD2();
		t.start();
		for(int i=0;i<10;i++) {
			System.out.println("Main Thread");
			Thread.sleep(2000);
		}
	}
}
```
##### Note: If main Thread calls join method on child thread object and child Thread calls join method on main thread object then both thread will wait forever and the program will be stucked(this is something like dead lock)

```
public class ThreadJoinDemo2 {
public static void main(String[] args) throws InterruptedException {
Thread.currentThread().join(); // if a thread calls join methods on same thread itself then the program will be stucked. In this case the thread has wait infinite time.
}
}
```

##### Sleep Method = > 
public static native void sleep(long ms) throws InterruptedException;
public static  void sleep(long ms, int ns); throws InterruptedException;


##### How a Thread can be Interrupted -> A thread can interrupt, a sleeping or waiting thread by using interrupt of Thread Class
public void interrupt()
```
class MyThreadSD extends Thread{
	
 public void run() {
		
		try {
			for(int i=0;i<10;i++) {
			System.out.println("I am Lazy Thread");
			Thread.sleep(2000);
		}
		}catch(InterruptedException e) {
			System.out.println("I got Interrupted");
		}		
	}
}
public class ThreadSleepDemo {

	public static void main(String[] args) {
		MyThreadSD t= new MyThreadSD();
		t.start();
		t.interrupt();
		System.out.println("End of Main Thread");
	}

}
Output: 
End of Main Thread
I am Lazy Thread
I got Interrupted
```
Note: Where ever we are calling interrupte method, if the target thread not in sleeping/waiting state then, there is no impact of interrupt call imediatiely. Interrupte call will be until target thread entered into sleeping/waiting state. If the target thread entered into sleeping/waiting state, then imediatiely interrupt target thread.

Comparension Table:
Property 		 Yield()  	 Join() 	  Sleep()

Purpose			wants to pause  
Is it overloaded	No		 yes		 yes
Is it final		No 		 yes		 yes
Is it throws IE		No		 yes		 yes
Is it Static		Yes		 No 		 Yes	

