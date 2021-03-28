package com.qq.modules.entryIcon.view.icon
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.entryIcon.model.EntryIconVO;
   import com.qq.modules.entryIcon.policy.PolicyManager;
   import com.qq.modules.entryIcon.policy.PolicyType;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class BaseEntryIcon extends QCanvas
   {
      
      public static const ICON_WIDTH:int = 60;
      
      public static const ICON_HEIGHT:int = 60;
       
      
      protected var m_imgContent:Image;
      
      private var m_effectMC:MovieClip;
      
      private var m_baseData:EntryIconVO;
      
      public function BaseEntryIcon(param1:EntryIconVO)
      {
         var _loc2_:int = 0;
         super();
         this.m_baseData = param1;
         this.id = "icon_" + this.m_baseData.id;
         if(this.m_baseData)
         {
            for each(_loc2_ in PolicyType.FIRST_CHECK_LIST)
            {
               if(this.m_baseData.hasPolicy(_loc2_))
               {
                  PolicyManager.instance.doPolicy(this.m_baseData,_loc2_);
               }
            }
         }
         this.refreshEffect();
         this.subData = param1;
      }
      
      public static function sortByOrder(param1:BaseEntryIcon, param2:BaseEntryIcon) : int
      {
         return param1.order - param2.order;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = ICON_WIDTH;
         this.height = ICON_HEIGHT;
         this.buttonMode = true;
         this.scrollRectEnabled = false;
         this.m_imgContent = new Image();
         this.m_imgContent.scrollRectEnabled = false;
         this.m_imgContent.ifRemovePreChildWhenChangeSource = true;
         this.m_imgContent.addEventListener(Event.COMPLETE,this.onLoadContentComplete);
         this.addChild(this.m_imgContent);
      }
      
      public function get baseData() : EntryIconVO
      {
         return this.m_baseData;
      }
      
      public function refreshEffect() : void
      {
         if(this.m_baseData)
         {
            this.showEffect = this.m_baseData.needEffect;
         }
         else
         {
            this.showEffect = false;
         }
      }
      
      protected function set source(param1:String) : void
      {
         this.m_imgContent.source = param1;
      }
      
      public final function get iconID() : uint
      {
         if(this.m_baseData)
         {
            return this.m_baseData.id;
         }
         return 0;
      }
      
      public final function get order() : Number
      {
         if(this.m_baseData)
         {
            return this.m_baseData.order;
         }
         return 0;
      }
      
      protected function set subData(param1:EntryIconVO) : void
      {
      }
      
      public function set showEffect(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEffect();
         }
         else
         {
            this.removeEffect();
         }
      }
      
      public function onClick() : void
      {
         var _loc1_:int = 0;
         if(this.m_baseData)
         {
            for each(_loc1_ in PolicyType.UI_CHECK_LIST)
            {
               if(this.m_baseData.hasPolicy(_loc1_))
               {
                  PolicyManager.instance.doPolicy(this.m_baseData,_loc1_);
               }
               this.m_baseData.applyCallBack();
            }
         }
      }
      
      private function removeEffect() : void
      {
         if(this.m_effectMC)
         {
            if(contains(this.m_effectMC))
            {
               removeChild(this.m_effectMC);
            }
            this.m_effectMC.stop();
         }
      }
      
      protected function addEffect() : void
      {
         if(this.m_effectMC == null)
         {
            this.m_effectMC = AssetManager.GetNewClass("Common_ActivityIcon_Flash") as MovieClip;
            this.m_effectMC.mouseChildren = false;
            this.m_effectMC.mouseEnabled = false;
            this.m_effectMC.x = ICON_WIDTH >> 1;
            this.m_effectMC.y = ICON_HEIGHT >> 1;
         }
         if(!this.m_imgContent.mcHolder)
         {
            this.m_effectMC.visible = false;
         }
         addChildAt(this.m_effectMC,0);
         this.m_effectMC.play();
      }
      
      protected function onLoadContentComplete(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.m_imgContent.mcHolder)
         {
            _loc2_ = this.m_imgContent.mcHolder.width;
            _loc3_ = this.m_imgContent.mcHolder.height;
            this.m_imgContent.x = ICON_WIDTH - _loc2_ >> 1;
            this.m_imgContent.y = ICON_HEIGHT - _loc3_ >> 1;
         }
         if(this.m_effectMC != null)
         {
            this.m_effectMC.visible = true;
         }
      }
      
      override public function Dispose() : void
      {
         if(hasDisposed == false)
         {
            this.m_imgContent.removeEventListener(Event.COMPLETE,this.onLoadContentComplete);
         }
         super.Dispose();
      }
   }
}
