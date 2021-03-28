package tencent.tools.behaviourTrees
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.behaviourTrees.core.BaseNode;
   
   public class BehaviourTreeCenter
   {
      
      private static var _instance:BehaviourTreeCenter;
       
      
      private var AITreeDic:Dictionary;
      
      private var AITreeVecList:Vector.<Vector.<BaseNode>>;
      
      private var factory:BehaviourTreeFactory;
      
      private var treeNum:int = 0;
      
      public function BehaviourTreeCenter(param1:Lock)
      {
         super();
         this.AITreeDic = new Dictionary();
         this.factory = new BehaviourTreeFactory();
      }
      
      public static function get instance() : BehaviourTreeCenter
      {
         if(!_instance)
         {
            _instance = new BehaviourTreeCenter(new Lock());
         }
         return _instance;
      }
      
      public function addClassRegister(param1:String, param2:Class) : void
      {
         this.factory.addClassRegister(param1,param2);
      }
      
      public function initAITreeConfig(param1:Class) : void
      {
         var _loc2_:ByteArray = new param1() as ByteArray;
         var _loc3_:XML = XML(_loc2_.readUTFBytes(_loc2_.bytesAvailable));
         this.factory.initAITreeConfig = _loc3_;
      }
      
      public function addAITreeByCode(param1:int, param2:int, param3:String, param4:Array = null) : BaseNode
      {
         var _loc5_:BaseNode = this.factory.createAITreeByCode(param3,param1,param2,param4);
         this.saveAI(_loc5_,param1);
         return _loc5_;
      }
      
      public function addAITreeByConfigClass(param1:int, param2:int, param3:Class, param4:Array = null) : BaseNode
      {
         var _loc5_:ByteArray = new param3() as ByteArray;
         var _loc6_:XML = XML(_loc5_.readUTFBytes(_loc5_.bytesAvailable));
         return this.addAITreeByConfigXML(param1,param2,_loc6_,param4);
      }
      
      public function addAITreeByConfigXML(param1:int, param2:int, param3:XML, param4:Array = null) : BaseNode
      {
         var _loc6_:BaseNode = null;
         if(this.AITreeDic[param1])
         {
            getLogger().warn("行为树:" + param1 + "已经添加了，不用重复添加");
            return this.AITreeDic[param1];
         }
         var _loc5_:int;
         if((_loc5_ = param3.@needConf) == 1)
         {
            _loc6_ = this.factory.createAITreeByConfigNew(param3,param1,param2,param4);
         }
         else
         {
            _loc6_ = this.factory.createAITreeByConfig(param3,param1,param2,param4);
         }
         this.saveAI(_loc6_,param1);
         return _loc6_;
      }
      
      private function saveAI(param1:BaseNode, param2:int) : void
      {
         if(!param1)
         {
            getLogger().error("行为树:" + param2 + "无法生成");
            return;
         }
         if(this.AITreeDic[param2])
         {
            return;
         }
         this.AITreeDic[param2] = param1;
         ++this.treeNum;
      }
      
      public function removeAI(param1:int) : void
      {
         var _loc2_:BaseNode = this.AITreeDic[param1];
         if(_loc2_)
         {
            getLogger().debug("移除AI: " + param1);
            _loc2_.dispose();
            this.AITreeDic[param1] = null;
            delete this.AITreeDic[param1];
            --this.treeNum;
         }
         else
         {
            getLogger().error("无法找到key: " + param1 + " 对应的AI行为树");
         }
      }
      
      public function runAIAll() : void
      {
         var _loc1_:BaseNode = null;
         for each(_loc1_ in this.AITreeDic)
         {
            if(_loc1_ && !_loc1_.isLock)
            {
               _loc1_.calculate();
            }
         }
      }
      
      public function setLock(param1:int, param2:Boolean) : void
      {
         var _loc3_:BaseNode = this.AITreeDic[param1];
         if(_loc3_)
         {
            _loc3_.isLock = param2;
         }
         else
         {
            getLogger().error("无法找到key: " + param1 + " 对应的AI行为树");
         }
      }
      
      public function hasAIByKey(param1:int) : Boolean
      {
         var _loc2_:BaseNode = this.AITreeDic[param1];
         return !!_loc2_ ? true : false;
      }
      
      public function runAI(param1:int) : void
      {
         var _loc2_:BaseNode = this.AITreeDic[param1];
         if(_loc2_)
         {
            _loc2_.calculate();
         }
         else
         {
            getLogger().error("无法找到key: " + param1 + " 对应的AI行为树");
         }
      }
   }
}

class Lock
{
    
   
   function Lock()
   {
      super();
   }
}
