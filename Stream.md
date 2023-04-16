# Streams

   1. Purpose -> to process the element in collection
   2. Stream s= c.stream();  -> stream mehtod is present in collection interface. Stream interface is present in util.stream package.
   2. Filter(Predicate<T> t)  -> to filter the elements
   3. Map(Function<T,R> f)   -> to perform some operation and create new map/collect object 
     Collect()
     Count()
     Sorted() - defauly sorted order
     Sorted(Comparator c) - Customized sorted order
     min(Comparator c)
     max(Comparator c)
    
     forEach()
     toArray() - copy to array
     Stream.of() -  to apply stream on array. group if values


   AL<integer> l=new AL<Integer>();
   l.add(0);l.add(10);l.add(30);l.add(5);l.add(3);
   
  e.g-1
   without streams:
  List<Integer> l1=new ArrayList<Integer>();
  for(Integer i : l){
   if(i%2==0){
      l1.add(i)
  }
  }
  Sopln(l1); [0,10,30]
  
  With Stream:
  
  List<Integer> l1=l.stream().filter(I->I%2==0).collect(Collector.toList());
  sopln(l1); [0,10,30]
  
  eg-2
   without streams:
  List<Integer> l1=new ArrayList<Integer>();
  for(Integer i : l){ 
      l1.add(i*2)
  }
  Sopln(l1); [0,20,60,10,6]
  
  With Stream:
  
  List<Integer> l1=l.stream().map(I->I*2).collect(Collector.toList());
  sopln(l1); [0,20,60,10,6]
  
   
   
   
