package com.qq.modules.td.view.game.ui
{
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   import com.qq.modules.td.view.game.layer.TDBasicLayer;
   import com.qq.modules.td.view.game.ui.plant.TDCardSlotPanel;
   import com.qq.modules.td.view.game.ui.skill.TDSkillSlotPanel;
   
   public class TDGameInfoPanel extends TDBasicLayer implements ITDLocationUpdatable
   {
       
      
      public var cardSlotPanel:TDCardSlotPanel;
      
      public var skillSlotPanel:TDSkillSlotPanel;
      
      public var bgPanel:TDBasicLayer;
      
      public var topPanel:TDBasicLayer;
      
      public var txtC:MixLayer;
      
      public function TDGameInfoPanel()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.name = "TDGameInfoPanel";
         this.bgPanel = new TDBasicLayer();
         addMixLayer(this.bgPanel);
         this.cardSlotPanel = new TDCardSlotPanel(1);
         addMixLayer(this.cardSlotPanel);
         this.topPanel = new TDBasicLayer();
         addMixLayer(this.topPanel);
         this.skillSlotPanel = new TDSkillSlotPanel();
         addMixLayer(this.skillSlotPanel);
         this.txtC = new MixLayer();
         addMixLayer(this.txtC);
         this.updateLocation();
      }
      
      public function updateLocation() : void
      {
         var _loc1_:Number = GameGloble.scaleCurrent;
         this.cardSlotPanel.initLocation(143,8);
         this.skillSlotPanel.initLocation(143 + this.cardSlotPanel.getCardBarWidth(),0);
         this.txtC.setLocation(33,62);
         this.x = TDConstant.passWarfieldPosX / GameGloble.scaleCurrent;
         graphics.clear();
         graphics.beginFill(65280,!!GameGloble.debugUIGraphics ? Number(0.5) : Number(0));
         graphics.drawRect(0,0,width,width);
         graphics.endFill();
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
      
      override public function set x(param1:Number) : void
      {
         param1 = int(param1);
         super.x = param1;
         if(display != this)
         {
            display.x = param1 * GameGloble.scaleCurrent;
         }
      }
   }
}
