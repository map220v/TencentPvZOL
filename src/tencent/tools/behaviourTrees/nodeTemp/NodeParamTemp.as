package tencent.tools.behaviourTrees.nodeTemp
{
   public class NodeParamTemp
   {
       
      
      public var pid:int;
      
      public var value:String;
      
      public var enumDes:String;
      
      public function NodeParamTemp(param1:XML)
      {
         super();
         this.pid = param1.@pid;
         this.value = param1.@value;
         this.enumDes = param1.@enumDes;
      }
   }
}
