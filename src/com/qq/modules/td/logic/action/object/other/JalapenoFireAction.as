package com.qq.modules.td.logic.action.object.other
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class JalapenoFireAction extends BasicAction
   {
       
      
      private var _burnParam:Array;
      
      private var _burnDirection:int;
      
      private var _damage:int;
      
      public function JalapenoFireAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_gameObject.hasRunningProp(TDConstant.Gameobject_Prop_InitUnitParam))
         {
            this._burnParam = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitUnitParam);
            this._burnDirection = this._burnParam[0];
            this._damage = this._burnParam[1];
            _gameObject.animation.gotoAndPlay("idle");
            _gameObject.animation.addEventListener(Event.COMPLETE,this.onBurnUp);
            if(this._burnDirection != 0)
            {
               this.fireNextTile();
            }
            return;
         }
         _gameObject.Dispose();
      }
      
      private function onBurnUp(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onBurnUp);
         _gameObject.animation.gotoAndPlay("idle2");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onBurnDown);
      }
      
      private function onBurnDown(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onBurnDown);
         _gameObject.animation.gotoAndPlay("idle3");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onBurnUp);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onBurnDown);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.Dispose();
      }
      
      private function fireNextTile() : void
      {
         var _loc1_:Array = [];
         var _loc2_:int = _gameObject.objectModel.column + this._burnDirection;
         if(_loc2_ >= TDGameInfo.getInstance().minCol && _loc2_ <= TDGameInfo.getInstance().maxCol)
         {
            _loc1_[TDConstant.Gameobject_Prop_InitUnitParam] = this._burnParam;
            TDGameObjectCmd.addGameObjectByColAndRow(TDConstant.UnitCatalog_Object,_gameObject.objectModel.staticInfo.type,_loc2_,_gameObject.objectModel.roadIndex,_loc1_);
         }
      }
   }
}
