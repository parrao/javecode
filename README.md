# Java8 features:
  1. Lambda expressions
  2. Functioal Interfaces
  3. Dafault methods in Interfaces
  4. static methods in Interfaces
  5. Predicate, Function, Consumer (Predefined functional interfaces)
  6. Method reference & constructor reference by double colon(::) operator
  7. Stream APIs
  8. Date and Time API(Joda API -> joda.org)
  
  Note -> in 1.8 paraller programming process to utilize the multicore processors
  
  
##  Lambda Expression: is just anonymous/nameless function(also say as closures)
    No name, No return type, No modifiers
    
 Examples:
    Public voud m1(){
    System.out.println("Hello");
    }
    Convert this into lambda
    Remove fn name and modifier      : () -> {  System.out.println("Hello"); }
    remove {} as only one line in fn : () -> System.out.println("Hello"); 
    
    eg2:
      public void addIint a,init b){
       System.out.println(a+b);
      }
      Lambda: (int a,int b)-> { system.out.println(a+b); } 
      simplified (a,b)-> system.out.println(a+b);
      
    eg3:
     public int square(int n){
       return n*n;
     }
     (int n) -> {return n*n;}
     simplified : n-> n*n;
     
     
## How to call/invoke lambda expressions:

  Functional Interfaces - which contains Single Abstract Method are considered as functional interfaces
  
  Some functional Interfaces in JDF - > Runnable ==> run();, Callable==> call();, Comparable ==> compareTo();
  
  Some Marker interfaces, which doesn't have any method declaration(empty interface) ->  Serializable, RandomAccess, Cloneable, SingleThreadModel 
  
  Note: prior to Java8, only abstract methos but from 1.8 version onwards default and static methods
  default void m1(){
  }
  static void m1(){
  }
  
  Note: In functional interfaces only one abstract method should contain but any no of default and static can add.
  
  
  Annotation: 
  @FunctionalInterface
  
  Sample:
  @FunctionalInterface
  interface Interf {
    public abstract void m1();
    default void m2(){
    }
    default void m3(){
    }
  }
  
  Sample2: -- Is valid, because the B extends A and parent is FI so child also considered as FI
  @FunctionalInterface
  interface A {
    public void m1();
  }
  @FunctionalInterface
  interface B extends A {
 
  }
  
  
  Sample3: - In child we overriding the parent abstract method so child is valid FI 
  @FunctionalInterface
  interface A {
    public void m1();
  }
  @FunctionalInterface
  interface B extends A {
  public void m1();
  }
  
  Sample4: - Invalid, as we are adding one more abstract method to child and we parent alos have one so it going to be two methods. 
  @FunctionalInterface
  interface A {
    public void m1();
  }
  @FunctionalInterface
  interface B extends A {
  public void m2();
  }
  
  
  
  
  Inner Class vs Lambda
  ----------------------
  Thread t = new Thread(){
  .......   // we are writing a class that extends Thread class and creating instand of it
  };
  
  Runnable r = new Runnable(){
     .....    // implementing Runnable interface
  };
     
  e.g :
  interface A{
  
  m1();
  m2();
  }
  A a = new A()
  {
    public void m1()
    {
    }
    public void m2()
    {
    }
  };
  
  Annonmous Inner class != Lambda Expressions
  Note: if annoymous Inner class implments an interface that contains single abstract methos then only we can replace that anonymous inner class with lambda expressions
  
  Default Method and Static methods: From 1.8 version inside interface -  without effecting implementation classes if we want to add new methods to the interface(extending interface funtionality) ===> default methods. To define general utility methods inside interface with static
  ---------------------------------
  
 Note: The static methods inside interface is not availble to class, even if the class is implementing the interface also. so we can call the methods using Interfaces only. 
  
  Default Methods:
  ---------------
  until 1.7V : Every methos present inside interface is always: public and abstract
  e.g: all below methos are equals inside interface
    void m1();
    public void m1();
    abstract void m1();
    public abstract void m1();
  
  Related Methods:
     1.8 V: default methods _ Static methods
     1.9 V : private methods
     
     Variables:
     ----------
     public static final
     

Default Methods | Virtual Extension Method | Defender Method:
------------------------------------------------------------
 interface I
 {
      public void m1();
      public void m2();
      deafult void m3(){                               // without effecting implemnetation classes if we want to add new method to the interface ==> Default Methods
         System.out.println("Default method");
      }
 }
 
 class Test1 implements I {
  public void m1(){}
  public void m2(){}
 }
 class Test2 implements I {
  public void m1(){}
  public void m2(){}
 }
  class Test100 implements I {
  public void m1(){}
  public void m2(){}
 }


 Notes: Object class methos we can't implment as default methods in interfaces.
 
 Which is costly Class vs Interface  ==> class is costly  becuase interface can't contains constructor, static blocks, instance block
 
 Static Methods: In interfaces -> If we want to define only static methods then instead of classes we can go for Interfaces. e.g like utility method  
 ------------------
 
 
 
