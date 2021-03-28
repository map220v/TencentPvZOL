package com.qq.modules.td.view.game
{
   import asgui.core.IDisposable;
   import com.qq.GameGloble;
   import flash.display.Sprite;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDTopSceneLayer extends Sprite implements IDisposable
   {
       
      
      public var mcLayer:Sprite;
      
      public var itemLayer:Sprite;
      
      private var _hasDisposed:Boolean;
      
      public function TDTopSceneLayer()
      {
         super();
         this.name = "TDTopSceneLayer";
         this.x = -230;
         this.mcLayer = new Sprite();
         this.mcLayer.mouseChildren = false;
         this.mcLayer.mouseEnabled = false;
         this.addChild(this.mcLayer);
         this.itemLayer = new Sprite();
         this.addChild(this.itemLayer);
         if(GameGloble.debugUIGraphics)
         {
            this.graphics.clear();
            this.graphics.beginFill(65280,0.3);
            this.graphics.drawRect(0,300,300,300);
            this.graphics.endFill();
         }
      }
      
      public function Dispose() : void
      {
         if(!this._hasDisposed)
         {
            RobotlegExtendCmd.removeMediatorByView(this);
         }
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
   }
}
