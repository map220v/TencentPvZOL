package com.qq.modules.td.logic.action.plant.durian
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class PDurianActionAttack extends BasicPlantAction
   {
       
      
      public function PDurianActionAttack()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onCompleteAttack);
      }
      
      private function onAttack(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Vector.<IGameObject> = null;
         var _loc5_:IGameObject = null;
         if(param1.frameLabel == "attack")
         {
            _loc2_ = [this.checkArea];
            _loc3_ = [_plant.objectModel.roadIndex - 1,_plant.objectModel.roadIndex,_plant.objectModel.roadIndex + 1];
            _loc4_ = TDSearchTargetUtils.searchTargetForPlant(_plant,_loc2_,_loc3_);
            for each(_loc5_ in _loc4_)
            {
               TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc5_);
            }
         }
      }
      
      private function onCompleteAttack(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.setAction();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         super.leaveState();
      }
      
      private function get checkArea() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_plant.objectModel.tileIndex);
         if(_loc2_ != null)
         {
            _loc1_.x = _loc2_.rect.left - _loc2_.rect.width;
            _loc1_.y = _loc2_.rect.top - _loc2_.rect.height;
            _loc1_.width = _loc2_.rect.width * 3;
            _loc1_.height = _loc2_.rect.height * 3;
         }
         return _loc1_;
      }
   }
}
