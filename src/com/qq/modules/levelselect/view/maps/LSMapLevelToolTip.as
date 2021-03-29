package com.qq.modules.levelselect.view.maps
{
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.core.IToolTip;
   import com.qq.display.QCanvas;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   
   public class LSMapLevelToolTip extends QCanvas implements IToolTip
   {
       
      
      public var txtTitle:Label;
      
      public var boxAchi:HBox;
      
      public var txtPowerNeed:Label;
      
      public var txtPowerHas:Label;
      
      public var stageId:int;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public function LSMapLevelToolTip()
      {
         super(LSMapLevelToolTipMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc2_:Image = null;
         super.InitializeComponent();
         this.styleName = "ToolTip";
         this.width = 150;
         this.height = 105;
         var _loc1_:VBox = new VBox();
         _loc1_.SetStyle("verticalGap","0");
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         this.addChild(_loc1_);
         this.txtTitle = new Label();
         this.txtTitle.width = 200;
         this.txtTitle.height = 25;
         this.txtTitle.styleName = ".TXT_Panel_Title";
         this.txtTitle.SetStyle("textAlign","left");
         _loc1_.addChild(this.txtTitle);
         this.txtPowerNeed = new Label();
         this.txtPowerNeed.styleName = ".TXT_HKHB_15_White";
         this.txtPowerNeed.SetStyle("fontSize","13");
         this.txtPowerNeed.width = 140;
         this.txtPowerNeed.height = 20;
         _loc1_.addChild(this.txtPowerNeed);
         this.txtPowerHas = new Label();
         this.txtPowerHas.width = 140;
         this.txtPowerHas.styleName = ".TXT_HKHB_15_White";
         this.txtPowerHas.SetStyle("fontSize","13");
         this.txtPowerHas.height = 20;
         _loc1_.addChild(this.txtPowerHas);
         _loc2_ = new Image();
         _loc2_.width = 140;
         _loc2_.height = 3;
         _loc2_.scaleContent = true;
         _loc2_.maintainAspectRatio = false;
         _loc2_.source = UrlManager.getUrl(0,"swf/td/ui/tooltip_line.swf");
         _loc1_.addChild(_loc2_);
         this.boxAchi = new HBox();
         this.boxAchi.left = 0;
         this.boxAchi.right = 0;
         this.boxAchi.height = 80;
         _loc1_.addChild(this.boxAchi);
      }
      
      public function get text() : Object
      {
         return null;
      }
      
      public function set text(param1:Object) : void
      {
         var _loc2_:Array = String(param1).split("_");
         this.stageId = _loc2_[0];
         this.levelId = _loc2_[1];
         this.subLevelId = _loc2_[2];
         var _loc3_:LSLevelTemplate = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(this.stageId,this.levelId,this.subLevelId);
         while(this.boxAchi.numChildren > 0)
         {
            this.boxAchi.removeChildAt(0);
         }
         this.txtPowerNeed.text = "";
         this.txtTitle.text = FontHKHB.LEVEL + " " + this.levelId + " - " + this.subLevelId;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
   }
}
