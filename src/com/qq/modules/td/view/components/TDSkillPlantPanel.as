package com.qq.modules.td.view.components
{
   import asgui.controls.Label;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class TDSkillPlantPanel extends QCanvas implements ITDLocationUpdatable
   {
       
      
      public var cardContainer:Sprite;
      
      public var cardList:Array;
      
      public var l_leftUseTimes:Label;
      
      public function TDSkillPlantPanel(param1:Class = null)
      {
         super(TDSkillPlantPanelMediator);
         this.cardList = [];
      }
      
      public function updateLocation() : void
      {
         var _loc1_:Point = this.parent.globalToLocal(new Point((GameGloble.stage.stageWidth - this.width) * 0.5 + 60,GameGloble.stage.stageHeight - 75));
         this.x = _loc1_.x;
         this.y = _loc1_.y;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.cardContainer = new Sprite();
         this.addChild(this.cardContainer);
         this.l_leftUseTimes = new Label();
         this.l_leftUseTimes.width = 160;
         this.l_leftUseTimes.y = 20;
         this.l_leftUseTimes.styleName = ".TXT_HKHB_18_Yellow_Shadow";
         this.l_leftUseTimes.SetStyle("fontSize","17");
         this.cardContainer.addChild(this.l_leftUseTimes);
      }
      
      public function setContainerVisible(param1:Boolean) : void
      {
         this.cardContainer.visible = param1;
      }
      
      public function addCard(param1:TDSkillCard) : void
      {
         this.cardList.push(param1);
         param1.x = 80 * (this.cardList.length - 1);
         this.cardContainer.addChild(param1);
         this.l_leftUseTimes.x = param1.x + 20;
      }
   }
}
