package com.qq.modules.td.logic.action.object.grassScroll
{
   import asgui.resources.AssetManager;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.setTimeout;
   
   public class GrassScrollActionRun extends BasicAction
   {
       
      
      private var _scrollMC:MovieClip;
      
      private var _grassPosX:int;
      
      private var _grassPosY:int;
      
      private var _grassGroundCatalog:int;
      
      private var _grassGroundType:int;
      
      public function GrassScrollActionRun()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:int = 0;
         super.enterState(param1);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            _loc3_ = int(_loc2_.res.@value);
            this._grassPosX = int(_loc2_.grass.@x);
            this._grassPosY = int(_loc2_.grass.@y);
            this._grassGroundCatalog = int(_loc2_.grassGround.@catalog);
            this._grassGroundType = int(_loc2_.grassGround.@type);
            this._scrollMC = AssetManager.instance.GetNewClass("TDGuideGrass" + _loc3_) as MovieClip;
            this._scrollMC.addEventListener(Event.ENTER_FRAME,this.onUpdate);
            this._scrollMC.x = this._grassPosX;
            this._scrollMC.y = this._grassPosY;
            CommandDispatcher.send(CommandName.TD_Add_DisplayObjectToScreen,this._scrollMC);
         }
      }
      
      private function onUpdate(param1:Event) : void
      {
         if(this._scrollMC.currentFrame >= this._scrollMC.totalFrames)
         {
            this._scrollMC.stop();
            this._scrollMC.removeEventListener(Event.ENTER_FRAME,this.onUpdate);
            TDGameObjectCmd.addGameObjectByPos(this._grassGroundCatalog,this._grassGroundType,this._grassPosX,this._grassPosY,null,{"isBottom":true});
            setTimeout(_gameObject.dispose,1000);
         }
      }
      
      override public function leaveState() : void
      {
         if(this._scrollMC != null)
         {
            this._scrollMC.removeEventListener(Event.ENTER_FRAME,this.onUpdate);
            UtilsManager.removeFromContainer(this._scrollMC);
            this._scrollMC = null;
         }
         super.leaveState();
      }
   }
}
