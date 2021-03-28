package tencent.tools.behaviourTrees.nodeTemp
{
   public class NodeTemp
   {
       
      
      public var nodeTypeID:int;
      
      public var nodeID:String;
      
      public var nodeClass:String;
      
      public var nodeName:String;
      
      public var nodeParamsList:Vector.<NodeParamsTemp>;
      
      public function NodeTemp(param1:int, param2:XML)
      {
         var _loc3_:XML = null;
         var _loc4_:NodeParamsTemp = null;
         super();
         this.nodeTypeID = param1;
         this.nodeID = param2.@nodeID;
         this.nodeClass = param2.@nodeClass;
         this.nodeName = param2.@nodeName;
         this.nodeParamsList = new Vector.<NodeParamsTemp>();
         for each(_loc3_ in param2..params)
         {
            _loc4_ = new NodeParamsTemp(_loc3_);
            this.nodeParamsList.push(_loc4_);
         }
      }
   }
}
