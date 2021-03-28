package com.qq.modules.basic
{
   import asgui.core.IDisposable;
   import asgui.modules.IModule;
   import asgui.simples.CanvasSimple;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.command.RegisterModuleCmd;
   import com.qq.utils.CommandDispatcher;
   import flash.display.Sprite;
   
   public class BaseModule extends CanvasSimple implements IModule
   {
      
      private static const Register_ViewClass:int = 0;
      
      private static const Register_Singtlon:int = 1;
      
      private static const Register_Command:int = 2;
      
      private static const Register_Proxy:int = 3;
       
      
      protected var _registerMap:Array;
      
      protected var _viewClassList:Array;
      
      protected var _viewSingtlonList:Array;
      
      protected var _commandRegisterList:Array;
      
      private var _isEntranceModule:Boolean;
      
      private var _hasUnloaded:Boolean;
      
      public function BaseModule(param1:Boolean = false)
      {
         super();
         this.left = 0;
         this.right = 0;
         this.top = 0;
         this.bottom = 0;
         this._isEntranceModule = param1;
         this.init();
         this.doRegister();
         this.initUI();
      }
      
      protected function doRegister() : void
      {
         RegisterModuleCmd.registerModuleMVC(this._registerMap[Register_Singtlon],this._registerMap[Register_Proxy],this._registerMap[Register_Command],this._registerMap[Register_ViewClass]);
      }
      
      protected function init() : void
      {
         this._registerMap = [];
         this._registerMap[Register_ViewClass] = [];
         this._registerMap[Register_Singtlon] = [];
         this._registerMap[Register_Command] = [];
         this._registerMap[Register_Proxy] = [];
         this._hasUnloaded = false;
      }
      
      protected function initUI() : void
      {
      }
      
      protected function registerViewClass(param1:Class, param2:Class) : void
      {
         var _loc3_:Array = this._registerMap[Register_ViewClass];
         _loc3_.push([param1,param2]);
      }
      
      protected function registerClassSingtlonRule(param1:Class) : void
      {
         var _loc2_:Array = this._registerMap[Register_Singtlon];
         _loc2_.push(param1);
      }
      
      protected function registerCommandList(param1:String, param2:Class, param3:Class) : void
      {
         var _loc4_:Array;
         (_loc4_ = this._registerMap[Register_Command]).push([param1,param2,param3]);
      }
      
      protected function registerProxyList(param1:Class, param2:Array = null) : void
      {
         var _loc3_:Array = this._registerMap[Register_Proxy];
         _loc3_.push([param1,param2]);
      }
      
      public function get data() : Object
      {
         return null;
      }
      
      public function set data(param1:Object) : void
      {
         CommandDispatcher.send(CommandName.Common_FinishLoadModule);
         if(this._isEntranceModule && !GameGloble.isFinishBaseModuleLoader)
         {
            GameFlowCmd.finishLoadBaseModule();
         }
      }
      
      public function Setup(param1:Sprite) : void
      {
      }
      
      public function Unload() : void
      {
         var _loc1_:IDisposable = null;
         if(this._hasUnloaded)
         {
            return;
         }
         if(this._registerMap)
         {
            while(this.numChildren > 0)
            {
               _loc1_ = this.removeChildAt(0) as IDisposable;
               if(_loc1_)
               {
                  _loc1_.Dispose();
               }
            }
            if(this._registerMap)
            {
               RegisterModuleCmd.unregisterModuleMVC(this._registerMap[Register_Singtlon],this._registerMap[Register_Proxy],this._registerMap[Register_Command],this._registerMap[Register_ViewClass]);
            }
            this._registerMap = null;
         }
         this._hasUnloaded = true;
      }
   }
}
