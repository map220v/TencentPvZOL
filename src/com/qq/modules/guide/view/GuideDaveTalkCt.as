package com.qq.modules.guide.view
{
   import asgui.containers.Canvas;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.core.Application;
   import asgui.core.IDisposable;
   import asgui.managers.PopUpManager;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.display.QCanvas;
   import com.qq.modules.guide.model.vo.GuideDialogueVO;
   import com.qq.modules.guide.model.vo.GuideSentenceVO;
   import com.qq.modules.guide.view.clips.GuideClipWithAction;
   import com.qq.templates.font.FontHKHB;
   import org.as3commons.logging.api.getLogger;
   
   public class GuideDaveTalkCt extends QCanvas implements IDisposable
   {
      
      private static var idCounter:int;
       
      
      public var movieCt:Canvas;
      
      public var bubble:Canvas;
      
      public var txt:Text;
      
      public var txtClick:Label;
      
      public var objView:GuideClipWithAction;
      
      private var objViews:Vector.<GuideClipWithAction>;
      
      private var objIds:Vector.<int>;
      
      private var objStyles:Vector.<String>;
      
      private var objChild:Array;
      
      public var obj:GuideDialogueVO;
      
      public function GuideDaveTalkCt(param1:GuideDialogueVO, param2:Class)
      {
         this.objIds = Vector.<int>([TDConstant.NPCType_DAVE,TDConstant.NPCType_DR]);
         this.objStyles = Vector.<String>([".Canvas_Guide_Bubble",".Canvas_Guide_Bubble_Right"]);
         this.objChild = [null,0];
         this.obj = param1;
         this.id = "guide_" + ++idCounter;
         getLogger().info("Guide::Begin:" + param1.title);
         super(param2);
      }
      
      public function Close() : void
      {
         PopUpManager.RemovePopUp(this);
         this.Dispose();
      }
      
      override public function Dispose() : void
      {
         if(this.objViews)
         {
            while(this.objViews.length > 0)
            {
               this.objViews.pop().dispose();
            }
            this.objViews = null;
         }
         this.objView = null;
         this.objIds = null;
         this.objStyles = null;
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         var _loc1_:int = 0;
         super.InitializeComponent();
         this.width = Application.application.minWidth;
         this.height = Application.application.minHeight;
         this.mouseBackground = true;
         this.scrollRectEnabled = false;
         this.movieCt = new Canvas();
         this.movieCt.scrollRectEnabled = false;
         this.movieCt.width = this.width;
         this.movieCt.height = this.height;
         this.addChild(this.movieCt);
         this.bubble = new Canvas();
         this.bubble.width = 275;
         this.bubble.height = 180;
         this.bubble.y = 110 - (675 - Application.application.minHeight) / 2;
         this.bubble.hcenter = -60;
         this.addChild(this.bubble);
         this.txt = new Text();
         this.txt.styleName = ".TXT_HKHB_14_Golden_Shadow";
         this.txt.SetStyle("fontSize","18");
         this.txt.SetStyle("textLeading","8");
         this.txt.right = 0;
         this.txt.left = 0;
         this.txt.height = 80;
         this.txt.vcenter = 0;
         this.txt.text = "";
         this.bubble.addChild(this.txt);
         this.txtClick = new Label();
         this.txtClick.styleName = ".TXT_HKHB_13_Blue";
         this.txtClick.SetStyle("fontSize","18");
         this.txtClick.text = FontHKHB.GUIDE_CLICK_TO_CONTINUE;
         this.txtClick.width = 80;
         this.txtClick.bottom = 5;
         this.txtClick.right = 0;
         this.bubble.addChild(this.txtClick);
         this.objViews = new Vector.<GuideClipWithAction>(this.objIds.length);
         _loc1_ = 0;
         while(_loc1_ < this.objIds.length)
         {
            this.objViews[_loc1_] = new GuideClipWithAction(GameGloble.getGuideUrlById(this.objIds[_loc1_]),this.objChild[_loc1_],id,this.objIds[_loc1_]);
            if(this.objIds[_loc1_] == 2300)
            {
               this.objViews[_loc1_].x = Application.application.minWidth / 2 - 80;
               this.objViews[_loc1_].y = Application.application.minHeight / 2 + 110;
            }
            else if(this.objIds[_loc1_] == 2500)
            {
               this.objViews[_loc1_].x = Application.application.minWidth / 2 + 50;
               this.objViews[_loc1_].y = Application.application.minHeight / 2 + 100;
            }
            _loc1_++;
         }
         this.bubble.alpha = 0;
      }
      
      public function update(param1:GuideSentenceVO) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         if(param1.hasNpc)
         {
            this.visible = true;
            _loc2_ = this.getIndexById(param1.actor);
            this.objView = this.objViews[_loc2_];
            this.objView.update();
            _loc3_ = this.objStyles[_loc2_];
            this.bubble.styleName = _loc3_;
            this.txt.text = param1.talk;
            if(param1.actor == 2300)
            {
               this.bubble.hcenter = -60;
            }
            else if(param1.actor == 2500)
            {
               this.bubble.hcenter = 60;
            }
            if(this.objView.root == null)
            {
               this.movieCt.addChild(this.objView);
            }
         }
         else
         {
            visible = false;
         }
         if(param1.move != null)
         {
            this.show();
            this.objView.setAction(param1.move);
            if(TDConstant.DaveLeaveAction == param1.move)
            {
               this.bubble.alpha = 0;
            }
         }
         else
         {
            if(this.objView)
            {
               this.objView.clearListens();
            }
            param1.tryDoAct();
         }
         getLogger("guide").info("update : " + param1.name);
      }
      
      private function getIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.objIds.length)
         {
            if(this.objIds[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function show() : void
      {
         PopUpManager.AddPopUp(this,null,false,false);
      }
   }
}
