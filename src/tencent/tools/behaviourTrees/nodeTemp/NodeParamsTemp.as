package tencent.tools.behaviourTrees.nodeTemp
{
   import flash.utils.Dictionary;
   
   public class NodeParamsTemp
   {
       
      
      public var paramType:String;
      
      public var defaultValue:String;
      
      public var paramDic:Dictionary;
      
      public function NodeParamsTemp(param1:XML)
      {
         var _loc2_:XML = null;
         var _loc3_:NodeParamTemp = null;
         super();
         this.paramType = param1.@paramType;
         this.defaultValue = param1.@defaultValue;
         this.paramDic = new Dictionary();
         for each(_loc2_ in param1..param)
         {
            _loc3_ = new NodeParamTemp(_loc2_);
            this.paramDic[_loc3_.pid] = _loc3_;
         }
      }
   }
}
