package com.qq.modules.guide.view.clips
{
   import asgui.blit.bone.BlitBone;
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.display.BlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayContainer;
   import flash.display.FrameLabel;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GuideBaseClip extends Sprite
   {
       
      
      protected var clipIdOrChildIndex;
      
      protected var mcParent:IBlitDisplayContainer;
      
      protected var mc:BlitBoneAnim;
      
      private var currentPlayLabels:Vector.<FrameLabel>;
      
      private var currentPlayLabel:FrameLabel;
      
      private var currentPlayLoop:Boolean;
      
      private var _currentPlayEndFunction:Function;
      
      protected var urlOrClass;
      
      private var d:BlitBoneData;
      
      public function GuideBaseClip(param1:*, param2:*)
      {
         super();
         this.clipIdOrChildIndex = param2;
         this.urlOrClass = param1;
      }
      
      public function get currentPlayEndFunction() : Function
      {
         return this._currentPlayEndFunction;
      }
      
      public function set currentPlayEndFunction(param1:Function) : void
      {
         this._currentPlayEndFunction = param1;
      }
      
      public function clear() : void
      {
         if(this.mcParent)
         {
            this.removeChild(this.mcParent.asset);
            this.mcParent.Dispose();
            this.mcParent = null;
         }
         if(this.mc)
         {
            this.mc.Dispose();
            this.mc = null;
         }
      }
      
      public function init(param1:*, param2:*) : void
      {
         this.urlOrClass = param1;
         var _loc3_:* = typeof param1;
         switch(_loc3_)
         {
            case "string":
               this.d = BlitBoneManager.impl.getBoneDataByUrl(param1 as String);
               if(this.d.hasLoaded)
               {
                  this.loadData(this.d);
               }
               else
               {
                  this.d.addEventListener(Event.COMPLETE,this.loaderCompleteHandler);
               }
               break;
            case "class":
         }
      }
      
      public function update() : void
      {
         if(!this.d || this.d.hasDisposed)
         {
            this.clear();
            this.init(this.urlOrClass,this.clipIdOrChildIndex);
         }
      }
      
      public function advanceFrames(param1:int = 1) : void
      {
         if(this.mc && this.mc.isPlaying)
         {
            this.mc.advanceTime(param1 * this.mc.frameRate);
         }
      }
      
      protected function loaderCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.loaderCompleteHandler);
         var _loc2_:BlitBoneData = param1.currentTarget as BlitBoneData;
         this.loadData(_loc2_);
      }
      
      protected function loadData(param1:BlitBoneData) : void
      {
         this.mcParent = new BlitDisplayContainer();
         this.addChild(this.mcParent.asset);
         this.mc = BlitBoneManager.impl.createBoneAnim(BlitBone.TYPE_USE_UNDEFAULT_BLIT_FACTORY);
         this.mc.data = param1;
         this.mcParent.AddChild(this.mc.asset);
         this.currentPlayLabels = param1.frameLabel;
         this.mc.render();
         this.mc.stop();
         if(this.currentPlayLabel != null)
         {
            this.gotoAndPlay(this.currentPlayLabel.name,this.currentPlayEndFunction,this.currentPlayLoop);
         }
      }
      
      public function dispose() : void
      {
         if(this.mc)
         {
            if(this.mc.asset && this.mc.asset.GetParent())
            {
               this.mc.asset.GetParent().RemoveChild(this.mc.asset);
            }
            this.mc = null;
         }
      }
      
      public function gotoAndPlay(param1:String, param2:Function = null, param3:Boolean = false) : void
      {
         var _loc4_:int = 0;
         this.currentPlayLoop = param3;
         this.currentPlayEndFunction = param2;
         if(this.mc)
         {
            this.currentPlayLabel = null;
            _loc4_ = 0;
            while(_loc4_ < this.currentPlayLabels.length)
            {
               if((this.currentPlayLabels[_loc4_] as FrameLabel).name == param1)
               {
                  this.currentPlayLabel = this.currentPlayLabels[_loc4_];
                  this.mc.gotoAndPlay(param1,!!param3 ? 0 : 1);
                  this.mc.removeEventListener(Event.COMPLETE,this.mcPlayCompleteHandler);
                  if(!param3)
                  {
                     this.mc.addEventListener(Event.COMPLETE,this.mcPlayCompleteHandler);
                  }
                  break;
               }
               _loc4_++;
            }
         }
         else
         {
            this.currentPlayLabel = new FrameLabel(param1,0);
            if(!this.d)
            {
               this.init(this.urlOrClass,this.clipIdOrChildIndex);
            }
         }
      }
      
      public function clearListens() : void
      {
         if(this.mc)
         {
            this.mc.removeEventListener(Event.COMPLETE,this.mcPlayCompleteHandler);
         }
      }
      
      protected function mcPlayCompleteHandler(param1:Event) : void
      {
         if(this.mc)
         {
            this.mc.removeEventListener(Event.COMPLETE,this.mcPlayCompleteHandler);
         }
         if(this.currentPlayEndFunction != null)
         {
            this.currentPlayEndFunction.apply();
         }
      }
   }
}
