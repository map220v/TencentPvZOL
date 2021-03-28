package com.qq.modules.td.logic.action.plant.sunflower
{
   import com.qq.CommandName;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.CommandDispatcher;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.Plan;
   
   public class PlanProductItem extends Plan
   {
       
      
      private var gameObject:IGameObject;
      
      private var _counter:int;
      
      private var _productItemType:int;
      
      private var _productItemNum:int;
      
      private var _offsetX:int;
      
      private var _offsetY:int;
      
      private var itemParams:Array;
      
      public function PlanProductItem(param1:IGameObject, param2:int, param3:int, param4:int, param5:int)
      {
         super();
         this.gameObject = param1;
         this._counter = 0;
         this._productItemType = param2;
         this._productItemNum = param3;
         this._offsetX = param4;
         this._offsetY = param5;
         this.itemParams = [];
      }
      
      public function addItemParams(param1:String, param2:Object) : void
      {
         this.itemParams.push([param1,param2]);
      }
      
      override protected function dispose() : void
      {
         this.itemParams = null;
         this.gameObject = null;
         super.dispose();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this._productItemNum)
         {
            this.generateItem(this._productItemType);
            _loc2_++;
         }
         setComplete();
      }
      
      protected function generateItem(param1:int) : void
      {
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         if(this.gameObject == null)
         {
            return;
         }
         var _loc2_:IGameObject = TDFactory.createNormalObject(param1);
         _loc2_.setLocation(this.gameObject.x + this._offsetX,this.gameObject.y + this._offsetY);
         var _loc3_:int = 0;
         while(_loc3_ < this.itemParams.length)
         {
            _loc4_ = this.itemParams[_loc3_][0];
            if((_loc5_ = (_loc2_ as Object).hasOwnProperty(_loc4_)) == true)
            {
               (_loc2_ as Object)[_loc4_] = this.itemParams[_loc3_][1];
            }
            _loc3_++;
         }
         CommandDispatcher.send(CommandName.TD_AddObjectToScreen,{"object":_loc2_});
         ++this._counter;
      }
   }
}
