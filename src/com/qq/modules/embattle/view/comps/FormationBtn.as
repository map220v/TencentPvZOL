package com.qq.modules.embattle.view.comps
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.templates.font.FontHKHB;
   import flash.display.MovieClip;
   
   public class FormationBtn extends QCanvas
   {
       
      
      protected var _selected:Boolean = false;
      
      protected var img:Image;
      
      protected var txt:Label;
      
      protected var img_out:Image;
      
      protected var txt_out:Label;
      
      protected var _out:Boolean;
      
      public var defendBtn:Button;
      
      protected var defendLabel:Label;
      
      public function FormationBtn(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         addChild(this.img);
         this.img.ifRemovePreChildWhenChangeSource = true;
         this.img.source = AssetManager.GetClass("City_embattle_formationBtn");
         this.img_out = new Image();
         addChild(this.img_out);
         this.img_out.ifRemovePreChildWhenChangeSource = true;
         this.img_out.source = AssetManager.GetClass("City_embattle_formationBtn_out");
         this.txt_out = new Label();
         addChild(this.txt_out);
         this.txt_out.text = FontHKHB.BATTLE_OUT;
         this.txt_out.styleName = ".TXT_HKHB_13_White";
         this.txt_out.SetStyle("color","#EDE963");
         this.txt_out.width = 100;
         this.txt_out.x = 8;
         this.txt_out.y = 60;
         this.txt_out.mouseChildren = this.txt_out.mouseEnabled = false;
         this.txt = new Label();
         addChild(this.txt);
         this.txt.styleName = ".TXT_HKHB_13_White";
         this.txt.SetStyle("color","#EDE963");
         this.txt.SetStyle("fontSize","35");
         this.txt.x = 13;
         this.txt.y = 20;
         this.txt.width = this.img.width;
         this.txt.height = this.img.height;
         this.txt.mouseChildren = this.txt.mouseEnabled = false;
         this.buttonMode = true;
         this.defendBtn = new Button();
         this.defendBtn.label = FontHKHB.BATTLE_SET_DEFEND;
         this.defendBtn.styleName = ".GreenButtonSmall";
         this.defendBtn.x = this.img.width - 2;
         this.defendBtn.vcenter = 0;
         this.defendBtn.width = 50;
         this.defendBtn.height = 25;
         addChild(this.defendBtn);
         this.defendLabel = new Label();
         this.defendLabel.styleName = ".TXT_HKHB_15_Red";
         this.defendLabel.width = this.img.width;
         this.defendLabel.height = 25;
         this.defendLabel.text = FontHKHB.BATTLE_DEFEND;
         this.defendLabel.y = this.img.height - this.defendLabel.height;
         addChild(this.defendLabel);
         this.width = this.img.width + this.defendBtn.width;
         this.height = this.img.height;
      }
      
      public function setLabel(param1:String) : void
      {
         this.txt.text = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         var _loc2_:int = param1 == true ? 2 : 1;
         (this.img.mcHolder as MovieClip).gotoAndStop(_loc2_);
         (this.img_out.mcHolder as MovieClip).gotoAndStop(_loc2_);
      }
      
      public function set out(param1:Boolean) : void
      {
         this._out = param1;
         this.img.visible = !!param1 ? false : true;
         this.img_out.visible = !!param1 ? true : false;
         this.txt_out.visible = !!param1 ? true : false;
      }
      
      public function setDefendState(param1:uint, param2:Boolean) : void
      {
         this.defendBtn.visible = false;
         this.defendLabel.visible = false;
         if(param2)
         {
            this.defendBtn.visible = false;
         }
         else if(uint(data) == param1)
         {
            this.defendBtn.visible = true;
            this.defendLabel.visible = true;
            this.defendBtn.label = FontHKHB.BATTLE_CANCEL_DEFEND;
         }
         else if(param1 == 0)
         {
            this.defendBtn.visible = true;
            this.defendBtn.label = FontHKHB.BATTLE_SET_DEFEND;
         }
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
   }
}
