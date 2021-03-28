package com.qq.modules.td.view.game
{
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicPage;
   import flash.display.Sprite;
   
   public class TDTopEffectLayer extends BasicPage
   {
       
      
      public var effSp:Sprite;
      
      public var dragSp:Sprite;
      
      public function TDTopEffectLayer()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         mouseEnabled = false;
         mouseChildren = false;
         this.effSp = new Sprite();
         addChild(this.effSp);
         this.dragSp = new Sprite();
         addChild(this.dragSp);
         if(GameGloble.debugUIGraphics)
         {
            graphics.clear();
            graphics.beginFill(255,0.1);
            graphics.drawRect(0,0,900,675);
         }
      }
   }
}
