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
 
 
 Predefined Functional Interfaces: to make lambda expression as common coding activity, these predefined functional interfaces are very helpful
 ---------------------------------
 Predicate
 Function
 Consumer
 Supplier
 ______________
 
 Two argument Predefined functional interfaces:
 --------------------------------------------------
 BiPredicate
 BiFunction
 BiConsumer
 __________________________
 primitive Functional interfaces
 --------------------------------
 IntPredicate
 IntFunction
 IntConsumer
 ........
 
Package: java.unil.function

Predicate(I):  - To do conditional checks by using lambda expression.  
----------
public abstract boolean test(T t)

Predicate Joining:
-----------------
e.g: P1 ---> to check whether the number is even or not
     p2 ---> to check whether the number > 10 or not
p1.and(p2).test(34)
p1.or(p2).test(34)
p1.negate().test(34)   -- Opposite(not), means to check the number is not even.

### Summary: Take some input and perform some conditional check and returns boolean value--> Predicate
 
Function: input-> perform some operation and produce result
---------
 Function
 i--> i*i
 s--> s.length()
 s--> s+s

interface Function<T,R>
{
   public R apply(T t);
}
### Summary: Take some input and perform some conditional check and returns the result which is need not be boolean type --> Function

Consumer:
---------
Function Chaining:
f1.andThen(f2).apply(i)
First f1 followed by f2

f1.compose(f2).apply(i)
first f2 and then f1

### Summary: Accept some input and perform required operation and not required to return anything ---> Consumer

Supplier:  just supply my required objects and it won't take any input --> Supplier
inteface Supplier<R>
{
  public R get(); 
}

  
BiPredicate - two arguments - 
-----------
  
Primitivre Predicate Type
--------------------------------------------
IntPredicate p=i->i%2==0;
DoublePredicate ....
LongPredicate  .....
 
Primitivre Function type
-------------------------
IntFunction  : can take int type as input
DoubleFunction : can take input type as double return type can be anytype
LongFuntion : can take long type as input



Primitivre Consumer type
-----------------------
IntConsumer
     void accept(int value)
        performs this operation on the given argument.
LongConsumer
DoubleConsumer
------------------------------
ObjDoubleConsumer<T>
void accept(T t, double value)
ObjIntConsumer<T>
ObjLongConsumer<T>
-------------------------------
 
Primitive Supplier Type
-----------------------
  BooleanSupplier
    boolean getAsBoolean()
  IntSupplier
    int getAsInt()
  
  LongSupplier
      long getAsLong()
  DoubleSupplier
      double getAsDouble()
  --------------------------------
  
  
 UnaryOperator  - If input and output are same type then we should go for UnaryOperator
  It is child of Function<T,T>
  
 -------------
     UnaryOperator<Integer> f=i->i*l;
       System.out.println(f.apply(f))
  
Primitive type of UnaryOperator:
     IntUnaryOperator f=i->i*i;
      System.out.println(f.applyAsInt(f))
    
     LongUnaryOperator f=i->i*i;
      System.out.println(f.applyAsLong(f))
  
    DoubleUnaryOperator f=i->i*i;
      System.out.println(f.applyAsDouble(f))
 
  BinaryOperator: 
  ------------- 
   It is the child of BiFuntion<T,T,T>
   BiFunction<String, String,String> f=(s1,s2)->s1+s2;
  System.out.println(f.apply("Parthi","rao"))
  
   BinaryOperator<String,> b=(s1,s2)->s1+s2;
  System.out.println(b.apply("Parthi","rao"))
  
  Primitive Type:
  ---------------
   IntBinaryOperator  b=(i1,i2)->i1*i2;
  System.out.println(b.applyAsInt(10,20));
  
  
  Method and Constructor Reference: The advantage is code reusbility.
  ================================
  :: - e.g
  
  Note: static and instance method can be reference
  classname::methodname
  objectname::methodname
  Rules:
    - no of argument and its type must be same
    - the return type, modifier should not be same. 
   
  Test::new(classname::new)  ==> constructor reference 
  When we should for CR - if FI returns an object
  
  
  
  
