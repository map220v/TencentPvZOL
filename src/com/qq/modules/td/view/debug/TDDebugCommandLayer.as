package com.qq.modules.td.view.debug
{
   import asgui.containers.Tile;
   import asgui.controls.Button;
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicPage;
   import flash.events.Event;
   
   public class TDDebugCommandLayer extends BasicPage
   {
      
      private static const layerW:int = 200;
      
      private static const laterH:int = 100;
       
      
      public var btnList:Array;
      
      public var btnNameList:Array;
      
      public var hBox:Tile;
      
      public function TDDebugCommandLayer()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:String = null;
         var _loc2_:Button = null;
         super.init();
         GameGloble.stage.addEventListener(Event.RESIZE,this.onResize);
         this.btnList = new Array();
         this.btnNameList = ["显示路径","隐藏路径","显示单位区域","隐藏单位区域","显示游戏区域","隐藏游戏区域","暂停游戏","继续游戏","重开游戏","速度x1","速度x2","速度x4","速度x0.5","弹出弹窗","增加阳光","增加燃料","跳过关卡","增加10个植物","增加10个僵尸","增加100硬币","跳至第?关","弹出天赋面板"];
         this.hBox = new Tile();
         this.hBox.width = 200;
         this.hBox.height = 500;
         for each(_loc1_ in this.btnNameList)
         {
            _loc2_ = new Button();
            _loc2_.styleName = ".GreenButtonMid";
            _loc2_.label = _loc1_;
            this.btnList.push(_loc2_);
            this.hBox.addChild(_loc2_);
         }
         addChild(this.hBox);
         this.onResize(null);
      }
      
      private function onResize(param1:Event) : void
      {
         this.hBox.x = GameGloble.stage.stageWidth - this.hBox.width;
      }
      
      override public function Dispose() : void
      {
         GameGloble.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.btnList = null;
         if(this.hBox == null)
         {
            this.hBox.Dispose();
            this.hBox = null;
         }
         super.Dispose();
      }
   }
}
