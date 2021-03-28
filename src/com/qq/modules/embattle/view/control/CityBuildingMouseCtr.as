package com.qq.modules.embattle.view.control
{
   import asgui.controls.Image;
   import com.qq.GameGloble;
   import com.qq.modules.embattle.model.EmbattleModel;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class CityBuildingMouseCtr
   {
       
      
      private var targets:Vector.<CityBuildingMouseCtrImpl>;
      
      private var num:int;
      
      private var targetDis:DisplayObject;
      
      private var isDispose:Boolean = false;
      
      private var enable:Boolean = false;
      
      public function CityBuildingMouseCtr()
      {
         super();
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         this.targetDis.removeEventListener(MouseEvent.ROLL_OVER,this.overHandler);
         this.targetDis.removeEventListener(MouseEvent.ROLL_OUT,this.outHandler);
         this.targetDis.removeEventListener(MouseEvent.CLICK,this.clickHandler);
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         this.targetDis = null;
         this.enable = false;
         if(this.targets)
         {
            _loc1_ = 0;
            while(_loc1_ < this.targets.length)
            {
               this.targets[_loc1_].dispose();
               _loc1_++;
            }
            this.targets = null;
         }
         this.isDispose = true;
      }
      
      public function start(param1:EmbattleModel) : void
      {
         if(this.targets)
         {
            this.dispose();
         }
         this.targetDis = param1.cityBuilding;
         var _loc2_:MovieClip = param1.cityBuilding.getChildByName("land") as MovieClip;
         var _loc3_:MovieClip = param1.cityBuilding.getChildByName("home") as MovieClip;
         _loc2_.buttonMode = true;
         _loc3_.buttonMode = true;
         this.realStart([_loc2_,_loc3_],param1.cityBuildingView);
      }
      
      public function setEnable(param1:Boolean) : void
      {
         if(this.enable == param1)
         {
            return;
         }
         this.enable = param1;
         if(!param1)
         {
            this.targetDis.removeEventListener(MouseEvent.ROLL_OVER,this.overHandler);
            this.targetDis.removeEventListener(MouseEvent.ROLL_OUT,this.outHandler);
            this.targetDis.removeEventListener(MouseEvent.CLICK,this.clickHandler);
            this.outHandler();
         }
         else
         {
            this.targetDis.addEventListener(MouseEvent.ROLL_OVER,this.overHandler);
            this.targetDis.addEventListener(MouseEvent.ROLL_OUT,this.outHandler);
            this.targetDis.addEventListener(MouseEvent.CLICK,this.clickHandler);
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.isDispose)
         {
            return;
         }
         if(this.targets)
         {
            _loc2_ = 0;
            while(_loc2_ < this.targets.length)
            {
               if(this.targets[_loc2_].setMouseClick(param1))
               {
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      private function overHandler(param1:MouseEvent) : void
      {
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      private function outHandler(param1:MouseEvent = null) : void
      {
         var _loc2_:int = 0;
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         if(this.targets)
         {
            _loc2_ = 0;
            while(_loc2_ < this.targets.length)
            {
               this.targets[_loc2_].setMouseOut();
               _loc2_++;
            }
         }
      }
      
      protected function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.targets)
         {
            _loc2_ = this.targets.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.targets[_loc3_].setMouseMove(param1);
               _loc3_++;
            }
         }
      }
      
      private function realStart(param1:Array, param2:Image) : void
      {
         var _loc4_:CityBuildingMouseCtrImpl = null;
         if(this.targets)
         {
            this.dispose();
         }
         this.targets = new Vector.<CityBuildingMouseCtrImpl>();
         this.num = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < this.num)
         {
            (_loc4_ = new CityBuildingMouseCtrImpl()).start(param1[_loc3_] as MovieClip,param2);
            this.targets.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
