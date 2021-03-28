package com.qq.modules.td.logic.mouseAction
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.display.DLoader;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TDReleaseAreaSkillAction implements ITDBaiscMouseAction
   {
       
      
      public var targetFlag:Sprite;
      
      public var lastShowTileData:TDMapTileData;
      
      public var skillID:int;
      
      public var col:int;
      
      public var row:int;
      
      private var _loader:DLoader;
      
      public function TDReleaseAreaSkillAction()
      {
         super();
      }
      
      public function start(param1:Array = null) : void
      {
      }
      
      private function onCompleteLoad(param1:Event) : void
      {
         var _loc2_:MovieClip = param1.currentTarget.content as MovieClip;
         if(_loc2_.numChildren > 0)
         {
            if(_loc2_.getChildAt(0) is MovieClip)
            {
               (_loc2_.getChildAt(0) as MovieClip).stop();
            }
         }
         this.targetFlag.addChild(_loc2_);
      }
      
      public function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(GameGloble.stage.mouseX,GameGloble.stage.mouseY);
         _loc2_ = TDUILayerManager.effectLayer.globalToLocal(_loc2_);
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc2_.x,_loc2_.y);
         var _loc4_:Boolean = false;
         if(_loc3_ != null)
         {
            if(this.lastShowTileData == null)
            {
               this.lastShowTileData = _loc3_;
               _loc4_ = true;
            }
            else if(this.lastShowTileData.index != _loc3_.index)
            {
               this.lastShowTileData = _loc3_;
               _loc4_ = true;
            }
            _loc2_.x = this.lastShowTileData.rect.x + this.lastShowTileData.rect.width * 0.5;
            _loc2_.y = this.lastShowTileData.rect.y + this.lastShowTileData.rect.height * 0.5;
            _loc2_ = TDUILayerManager.effectLayer.localToGlobal(_loc2_);
         }
         else
         {
            _loc2_.x = GameGloble.stage.mouseX;
            _loc2_.y = GameGloble.stage.mouseY;
         }
         this.targetFlag.x = _loc2_.x;
         this.targetFlag.y = _loc2_.y;
         if(_loc4_)
         {
            CommandDispatcher.send(CommandName.TD_HideSkillArea);
            CommandDispatcher.send(CommandName.TD_ShowSkillArea,{
               "tileIndex":this.lastShowTileData.index,
               "col":this.col,
               "row":this.row
            });
         }
      }
      
      public function onMouseClick(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         _loc2_ = TDUILayerManager.effectLayer.globalToLocal(_loc2_);
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc2_.x,_loc2_.y);
         TDMouseActionCmd.endChooseSkillArea();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Rectangle = TDGameInfo.getInstance().getEffectRectByRoadTile(_loc3_.index,this.col,this.row);
      }
      
      public function Dispose() : void
      {
         if(this.targetFlag != null)
         {
            UtilsManager.removeFromContainer(this.targetFlag);
            this.targetFlag = null;
         }
         if(this._loader != null)
         {
            this._loader.dispose();
            this._loader = null;
         }
         this.lastShowTileData = null;
         CommandDispatcher.send(CommandName.TD_HideSkillArea);
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         GameGloble.stage.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         CommandDispatcher.send(CommandName.TD_CancelUseSkill);
      }
      
      public function get hasDisposed() : Boolean
      {
         return true;
      }
   }
}
