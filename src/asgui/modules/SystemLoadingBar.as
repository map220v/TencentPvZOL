package asgui.modules
{
   import asgui.core.ByteLoader;
   import asgui.core.ILoadingWatchable;
   import asgui.managers.ConfigManager;
   import asgui.managers.SystemManager;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.text.TextField;
   
   public class SystemLoadingBar extends Sprite
   {
       
      
      private var systemManager:SystemManager;
      
      private var modules:Array;
      
      private var currentModule:ILoadingWatchable;
      
      private var loaderLoaded:Boolean;
      
      private var moduleLoaded:int;
      
      private var txt:TextField;
      
      private var leftLoaders:int;
      
      private var workingLoadersTotal:int;
      
      private var workingLoader;
      
      public var label:String = "";
      
      public var loadingProgressModule:ILoadingProgressModule;
      
      public function SystemLoadingBar(param1:SystemManager)
      {
         this.modules = [];
         super();
         this.systemManager = param1;
         param1.addChild(this);
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      public function Clear() : void
      {
         this.moduleLoaded = 0;
         this.modules = [];
         this.currentModule = null;
         if(this.loadingProgressModule)
         {
            this.loadingProgressModule.Draw("",0,100,0,100,0,100);
         }
      }
      
      public function Dispose() : void
      {
         this.Clear();
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         if(this.loadingProgressModule)
         {
            this.loadingProgressModule.Dispose();
            this.loadingProgressModule = null;
         }
         if(this.parent == this.systemManager)
         {
            this.systemManager.removeChild(this);
         }
      }
      
      public function LoadProgressModule(param1:String) : void
      {
         var _loc2_:Loader = new Loader();
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.LoaderCompleteHandler);
         _loc2_.load(new URLRequest(param1));
      }
      
      public function SetLoader(param1:ILoadingWatchable) : void
      {
         this.currentModule = param1;
      }
      
      public function AddLoader(param1:ILoadingWatchable) : void
      {
         this.modules.push(param1);
      }
      
      public function Hold(param1:ILoadingWatchable) : void
      {
         this.Clear();
         this.modules = [param1];
         this.currentModule = param1;
         this.leftLoaders = 0;
         this.workingLoadersTotal = 1;
      }
      
      public function LoadNext() : void
      {
         if(this.modules.length <= this.moduleLoaded)
         {
            this.currentModule = null;
            this.Update();
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else
         {
            this.currentModule = this.modules[this.moduleLoaded] as ILoadingWatchable;
            this.currentModule.addEventListener(Event.COMPLETE,this.ModuleLoadedHandler);
            this.leftLoaders = this.currentModule.leftLoaders;
            this.workingLoadersTotal = this.currentModule.leftLoaders;
            this.Update();
         }
      }
      
      private function DrawGraphic(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc15_:Number = NaN;
         var _loc7_:int = 800;
         var _loc8_:int = 600;
         var _loc9_:int = 200;
         var _loc10_:int = 4;
         var _loc11_:uint = 5592405;
         var _loc12_:uint = 16777215;
         var _loc13_:Number = (_loc7_ - _loc9_) / 2;
         var _loc14_:Number = (_loc8_ - _loc10_) / 2;
         this.label = ConfigManager.loadingLabel;
         var _loc16_:Number;
         _loc15_ = (_loc16_ = param5 / param6 + param3 / param6 / param4 + param1 / param6 / param4 / param2) * _loc9_;
         if(!this.txt)
         {
            this.txt = new TextField();
            this.txt.width = _loc9_;
            this.addChild(this.txt);
         }
         this.txt.x = 0;
         this.txt.y = 0;
         this.txt.text = "" + param5 + " / " + param6 + "   " + param3 + " / " + param4 + "   " + int(100 * param1 / param2) + "%";
         graphics.clear();
         graphics.beginFill(_loc11_);
         graphics.drawRect(0,20,_loc9_,_loc10_);
         graphics.beginFill(_loc12_);
         graphics.drawRect(0,20,_loc15_,_loc10_);
      }
      
      private function ClearGrapich() : void
      {
         if(this.txt && this.contains(this.txt))
         {
            this.removeChild(this.txt);
            this.txt = null;
         }
         graphics.clear();
      }
      
      private function DrawLoader(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.loadingProgressModule.Draw(this.workingLoader,param1,param2,param3,param4,param5,param6);
      }
      
      private function ModuleLoadedHandler(param1:Event) : void
      {
         var _loc2_:Array = this.modules;
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.ModuleLoadedHandler);
         ++this.moduleLoaded;
         this.LoadNext();
      }
      
      private function LoaderCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoaderCompleteHandler);
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         this.loadingProgressModule = (param1.currentTarget as LoaderInfo).content as ILoadingProgressModule;
         this.addChild(this.loadingProgressModule as DisplayObject);
         this.loaderLoaded = true;
         this.ClearGrapich();
         this.Update();
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         this.Update();
      }
      
      public function Update() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:ByteLoader = null;
         var _loc10_:MovieClip = null;
         var _loc11_:Loader = null;
      }
   }
}
