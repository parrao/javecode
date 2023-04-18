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

Defining a Thread - in two ways
------------------
1. By extending Thread Class
2. By implementing Runnable interface

   By Extending Thread: 
   
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
   
   
   
