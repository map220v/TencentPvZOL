package com.qq.modules.td.view.loading
{
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicPage;
   import com.qq.utils.UtilsManager;
   
   public class TDLoadPage extends BasicPage
   {
       
      
      public var mc;
      
      public function TDLoadPage()
      {
         super();
         var _loc1_:int = GameGloble.stage.stageWidth;
         var _loc2_:int = GameGloble.stage.stageHeight;
         this.graphics.beginFill(0);
         this.graphics.drawRect(0,0,_loc1_,_loc2_);
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function Dispose() : void
      {
         UtilsManager.removeFromContainer(this);
         this.mc = null;
         super.Dispose();
      }
   }
}
