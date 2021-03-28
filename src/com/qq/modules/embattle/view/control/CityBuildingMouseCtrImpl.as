package com.qq.modules.embattle.view.control
{
   import asgui.controls.Image;
   import asgui.managers.ToolTipManager;
   import com.qq.constant.city.CityConstant;
   import com.qq.modules.card.command.CardViewCmd;
   import com.qq.modules.city.model.templates.BuildingTemplateFactory;
   import com.qq.modules.city.model.templates.ce.BuildingTemplateCE;
   import com.qq.modules.embattle.command.EmbattleCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.sound.command.UISoundCmd;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class CityBuildingMouseCtrImpl
   {
       
      
      private var cityBuildingView:Image;
      
      private var target:Sprite;
      
      private var isOver:Boolean = false;
      
      private var enable:Boolean = false;
      
      private var overFilters:Array;
      
      public function CityBuildingMouseCtrImpl()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(this.target)
         {
            this.target.filters = null;
            this.target = null;
         }
         this.cityBuildingView = null;
      }
      
      public function setOverFilters(param1:Array) : void
      {
         this.overFilters = param1;
      }
      
      public function getOverFilters() : Array
      {
         if(!this.overFilters)
         {
            this.overFilters = [new GlowFilter(16772164,1,4,4,8)];
         }
         return this.overFilters;
      }
      
      public function start(param1:Sprite, param2:Image) : void
      {
         if(this.target)
         {
            this.dispose();
         }
         this.target = param1;
         this.cityBuildingView = param2;
      }
      
      public function setMouseClick(param1:MouseEvent) : Boolean
      {
         if(this.isOver)
         {
            if(this.target.name == "home")
            {
               CardViewCmd.showMainWd();
               return true;
            }
            if(this.target.name == "land")
            {
               EmbattleCmd.zoomInCityHomeView(this.cityBuildingView,EmbattleConst.MODE_HOME);
               return true;
            }
         }
         return false;
      }
      
      public function setMouseOut() : void
      {
         if(this.isOver)
         {
            ToolTipManager.DestroyToolTip();
         }
         this.target.filters = null;
         this.isOver = false;
      }
      
      public function setMouseMove(param1:MouseEvent) : void
      {
         var _loc3_:Point = null;
         var _loc4_:BuildingTemplateCE = null;
         var _loc5_:String = null;
         var _loc2_:Boolean = false;
         if(this.target.hitTestPoint(param1.stageX,param1.stageY,true) && !this.isTransparent(this.target))
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         if(_loc2_ == this.isOver)
         {
            return;
         }
         this.isOver = _loc2_;
         if(this.isOver)
         {
            this.target.filters = this.getOverFilters();
            _loc3_ = this.target.localToGlobal(new Point());
            if(this.target.name == "home")
            {
               _loc5_ = (_loc4_ = BuildingTemplateFactory.instance.getBuilding(CityConstant.Building_Myhome)).desc;
            }
            else if(this.target.name == "land")
            {
               _loc5_ = "布阵";
            }
            ToolTipManager.CreateToolTip(_loc5_,_loc3_.x,_loc3_.y);
            UISoundCmd.play_block_highlight();
         }
         else
         {
            ToolTipManager.DestroyToolTip();
            this.target.filters = null;
         }
      }
      
      private function isTransparent(param1:DisplayObject) : Boolean
      {
         var _loc2_:BitmapData = new BitmapData(1,1,true,0);
         _loc2_.draw(param1,new Matrix(1,0,0,1,-param1.mouseX,-param1.mouseY));
         var _loc3_:uint = _loc2_.getPixel32(0,0);
         return _loc3_ == 0;
      }
   }
}
