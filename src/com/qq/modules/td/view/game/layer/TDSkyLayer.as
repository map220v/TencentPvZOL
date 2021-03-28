package com.qq.modules.td.view.game.layer
{
   import asgui.blit.Blit;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.starling.IBlitDisplayStarling;
   import com.qq.GameGloble;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDLeaf;
   import com.qq.modules.td.logic.unit.object.TDSun;
   import com.qq.utils.QDisplayUtil;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class TDSkyLayer extends TDBasicLayer
   {
       
      
      public var effectsLayer:IBlitDisplayContainer;
      
      private var m_lastSun:TDSun;
      
      private var m_lastLeaf:TDLeaf;
      
      public function TDSkyLayer()
      {
         super();
         this.effectsLayer = Blit.factory.CreateBlitContainer();
         if(this.effectsLayer is Sprite)
         {
            (this.effectsLayer as Sprite).mouseChildren = false;
            (this.effectsLayer as Sprite).mouseEnabled = false;
            this.addChild(this.effectsLayer as DisplayObject);
         }
         else
         {
            this.effectsLayer.x = this.x;
            this.addComponentToLayer(this.effectsLayer as IBlitDisplayStarling);
         }
         if(GameGloble.debugUIGraphics)
         {
            this.graphics.clear();
            this.graphics.beginFill(255,0.3);
            this.graphics.drawRect(0,0,50,300);
            this.graphics.endFill();
         }
      }
      
      override public function addGameObjectTolayer(param1:IGameObject, param2:Boolean = false) : void
      {
         super.addGameObjectTolayer(param1,param2);
         if(param1 is TDSun)
         {
            this.m_lastSun = param1 as TDSun;
         }
         else if(param1 is TDLeaf)
         {
            this.m_lastLeaf = param1 as TDLeaf;
         }
      }
      
      override protected function init() : void
      {
         super.init();
         QDisplayUtil.registerView("$TDSkyLayer",this);
      }
      
      private function getRealTarget(param1:GameObject) : Object
      {
         var _loc2_:Object = null;
         if(param1)
         {
            _loc2_ = param1.frontLayer;
            if(_loc2_ is Sprite)
            {
               return _loc2_;
            }
            return _loc2_.getChildAt(0)._holder;
         }
         return null;
      }
      
      public function get lastSun() : Object
      {
         return this.getRealTarget(this.m_lastSun);
      }
      
      public function get lastLeaf() : Object
      {
         return this.getRealTarget(this.m_lastLeaf);
      }
      
      override public function Dispose() : void
      {
         if(!hasDisposed)
         {
            while(this.effectsLayer.numChildren > 0)
            {
               this.effectsLayer.RemoveChildAt(0).Dispose();
            }
            QDisplayUtil.unregisterView("$TDSkyLayer");
         }
         super.Dispose();
      }
   }
}
