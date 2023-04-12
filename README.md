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
  
     
     
