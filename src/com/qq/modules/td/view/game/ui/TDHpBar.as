package com.qq.modules.td.view.game.ui
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.IDisposable;
   import com.qq.utils.blit.QBlitUI;
   
   public class TDHpBar implements IDisposable
   {
       
      
      private var _armorHpBarW:int;
      
      private var _hpBarW:int;
      
      private var _hpBar:IBlitClip;
      
      private var _hpBarBorder:IBlitClip;
      
      private var _armorBar:IBlitClip;
      
      private var _armorBarBorder:IBlitClip;
      
      private var _hpBarMC:IBlitDisplayContainer;
      
      public function TDHpBar()
      {
         super();
         this._hpBarMC = QBlitUI.createContainer();
         this._hpBarMC.mouseEnabled = false;
         this._hpBarBorder = QBlitUI.createClipFromClassName("TDUI_hpBarBorderImg");
         this._hpBarBorder.x = 1;
         this._hpBarBorder.y = 2;
         this._hpBarMC.AddChild(this._hpBarBorder);
         this._hpBar = QBlitUI.createClipFromClassName("TDUI_hpBarImg");
         this._hpBar.x = 2;
         this._hpBar.y = 3;
         this._hpBarMC.AddChild(this._hpBar);
         this._armorBarBorder = QBlitUI.createClipFromClassName("TDUI_armorBarBorderImg");
         this._armorBarBorder.x = 0;
         this._armorBarBorder.y = 0;
         this._hpBarMC.AddChild(this._armorBarBorder);
         this._armorBar = QBlitUI.createClipFromClassName("TDUI_armorBarImg");
         this._armorBar.x = 1;
         this._armorBar.y = 1;
         this._hpBarMC.AddChild(this._armorBar);
         this._hpBarW = this._hpBar.width;
         this._armorHpBarW = this._armorBar.width;
      }
      
      public function get hpBarMC() : IBlitDisplayContainer
      {
         return this._hpBarMC;
      }
      
      public function updateValue(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         if(param2 != 0)
         {
            _loc5_ = this._hpBarW * param1 / param2;
         }
         this._hpBar.width = _loc5_;
         if(param4 >= 0)
         {
            if(param3 == 0)
            {
               this._armorBar.visible = false;
               this._armorBarBorder.visible = false;
            }
            if(this._armorHpBarW != 0)
            {
               _loc5_ = this._armorHpBarW * param3 / param4;
            }
            this._armorBar.asset.width = _loc5_;
         }
      }
      
      public function Dispose() : void
      {
         if(this._hpBarMC != null)
         {
            this._hpBarMC.Dispose();
            this._hpBarMC = null;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return true;
      }
   }
}
