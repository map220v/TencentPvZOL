package com.qq.modules.td.logic.bt_ai.aiNode
{
   import com.qq.GameGloble;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import tencent.tools.behaviourTrees.core.BaseNode;
   
   public class BaseNodePvz extends BaseNode
   {
       
      
      public var selfObj:IGameObject;
      
      public function BaseNodePvz(param1:int = 30)
      {
         super();
         GameGloble.injector.injectInto(this,false);
         this.nodeType = param1;
      }
      
      protected function initlize() : void
      {
      }
      
      override public function setStaticParams(param1:Array) : void
      {
         this.selfObj = param1[0];
         this.initlize();
      }
      
      public function get mySelfData() : TDGameObjectData
      {
         return this.selfObj.objectModel;
      }
      
      protected function createAI(param1:Object) : BaseNodePvz
      {
         var _loc2_:BaseNodePvz = null;
         if(param1 is Class)
         {
            _loc2_ = new (param1 as Class)();
            _loc2_.setStaticParams([this.selfObj]);
         }
         return _loc2_;
      }
   }
}
