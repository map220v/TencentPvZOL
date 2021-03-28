package tencent.tools.behaviourTrees
{
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import tencent.tools.behaviourTrees.core.BaseNode;
   import tencent.tools.behaviourTrees.core.ChioceNode;
   import tencent.tools.behaviourTrees.core.SequenceNode;
   import tencent.tools.behaviourTrees.nodeTemp.NodeParamTemp;
   import tencent.tools.behaviourTrees.nodeTemp.NodeParamsTemp;
   import tencent.tools.behaviourTrees.nodeTemp.NodeTemp;
   import tencent.tools.behaviourTrees.record.RecordData;
   
   public class BehaviourTreeFactory
   {
       
      
      private var classRegs:Array;
      
      private var BehaviourTreeTempDic:Dictionary;
      
      public function BehaviourTreeFactory()
      {
         this.classRegs = [];
         super();
         this.addClassRegister("SequenceNode",SequenceNode);
         this.addClassRegister("ChioceNode",ChioceNode);
         this.BehaviourTreeTempDic = new Dictionary();
      }
      
      public function set initAITreeConfig(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:NodeTemp = null;
         for each(_loc2_ in param1..behaviourNode)
         {
            for each(_loc3_ in _loc2_..node)
            {
               _loc4_ = new NodeTemp(_loc2_.@nodeTypeID,_loc3_);
               this.BehaviourTreeTempDic[_loc4_.nodeID] = _loc4_;
            }
         }
      }
      
      public function addClassRegister(param1:String, param2:Class) : void
      {
         this.classRegs[param1] = param2;
      }
      
      public function createAITreeByConfig(param1:XML, param2:int, param3:int, param4:Array = null, param5:BaseNode = null) : BaseNode
      {
         var _loc10_:XML = null;
         var _loc11_:XML = null;
         var _loc12_:BaseNode = null;
         var _loc6_:String = param1.@nodeID;
         var _loc8_:BaseNode;
         var _loc7_:Class;
         (_loc8_ = new (_loc7_ = this.classRegs[_loc6_] != null ? this.classRegs[_loc6_] : getDefinitionByName(_loc6_) as Class)() as BaseNode).nodeName = param1.@nodeName;
         _loc8_.aiKey = param2;
         _loc8_.aiTypeKey = param3;
         if(param5)
         {
            _loc8_.setRootNode(param5);
         }
         else
         {
            param5 = _loc8_;
         }
         var _loc9_:Array = [];
         for each(_loc10_ in param1.param)
         {
            _loc9_.push(_loc10_.@value);
         }
         if(_loc9_.length != 0)
         {
            _loc8_.setDynamicParams(_loc9_);
         }
         if(param4)
         {
            _loc8_.setStaticParams(param4);
         }
         this.createRecordData(_loc8_.ID,_loc7_,param4,_loc9_);
         for each(_loc11_ in param1.node)
         {
            _loc12_ = this.createAITreeByConfig(_loc11_,param2,param3,param4,param5);
            _loc8_.addNode(_loc12_);
         }
         return _loc8_;
      }
      
      public function createAITreeByConfigNew(param1:XML, param2:int, param3:int, param4:Array = null, param5:BaseNode = null) : BaseNode
      {
         var _loc13_:XML = null;
         var _loc14_:XML = null;
         var _loc15_:NodeParamsTemp = null;
         var _loc16_:NodeParamTemp = null;
         var _loc17_:BaseNode = null;
         var _loc6_:NodeTemp;
         var _loc7_:String = (_loc6_ = this.BehaviourTreeTempDic[String(param1.@nodeID)] as NodeTemp).nodeClass;
         var _loc8_:Class;
         var _loc9_:BaseNode = new (_loc8_ = this.classRegs[_loc7_] != null ? this.classRegs[_loc7_] : getDefinitionByName(_loc7_) as Class)() as BaseNode;
         var _loc10_:String;
         if((_loc10_ = param1.@nodeName) == null || _loc10_ == "")
         {
            _loc10_ = _loc6_.nodeName;
         }
         _loc9_.nodeName = _loc10_;
         _loc9_.aiKey = param2;
         _loc9_.aiTypeKey = param3;
         if(param5)
         {
            _loc9_.setRootNode(param5);
         }
         else
         {
            param5 = _loc9_;
         }
         var _loc11_:Array = [];
         var _loc12_:int = 0;
         for each(_loc13_ in param1.param)
         {
            _loc16_ = (_loc15_ = _loc6_.nodeParamsList[_loc12_]).paramDic[Number(_loc13_.@pid)];
            _loc11_.push(_loc16_.value);
            _loc12_++;
         }
         if(_loc11_.length != 0)
         {
            _loc9_.setDynamicParams(_loc11_);
         }
         if(param4)
         {
            _loc9_.setStaticParams(param4);
         }
         this.createRecordData(_loc9_.ID,_loc8_,param4,_loc11_);
         for each(_loc14_ in param1.node)
         {
            _loc17_ = this.createAITreeByConfigNew(_loc14_,param2,param3,param4,param5);
            _loc9_.addNode(_loc17_);
         }
         return _loc9_;
      }
      
      public function createAITreeByCode(param1:String, param2:int, param3:int, param4:Array = null) : BaseNode
      {
         var _loc6_:BaseNode;
         var _loc5_:Class;
         (_loc6_ = new (_loc5_ = this.classRegs[param1] != null ? this.classRegs[param1] : getDefinitionByName(param1) as Class)() as BaseNode).aiKey = param2;
         _loc6_.aiTypeKey = param3;
         if(param4)
         {
            _loc6_.setStaticParams(param4);
         }
         return _loc6_;
      }
      
      private function createRecordData(param1:int, param2:Class, param3:Array, param4:Array) : void
      {
         var _loc5_:RecordData;
         (_loc5_ = new RecordData()).exeOID = param1;
         _loc5_.exeDynamicParams = param4;
         _loc5_.exeNodeClass = param2;
         _loc5_.exeStaticParams = param3;
      }
   }
}
